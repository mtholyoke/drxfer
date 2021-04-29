class TransfersController < ApplicationController
  # GET /transfers
  # GET /transfers.xml
  def index
    @agreement = Agreement.find(params[:agreement_id])
    @transfers = Transfer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transfers }
    end
  end

  # GET /transfers/1
  # GET /transfers/1.xml
  def show
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transfer }
    end
  end

  # GET /transfers/new
  # GET /transfers/new.xml
  def new
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.new
    @transfer.attachments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transfer }
    end
  end

  # POST /transfers
  # POST /transfers.xml
  def create
    @agreement = Agreement.find(params[:agreement_id])

    # In addition to the fact that each transfer can have multiple attachments
    # Each attachment may be submitted with multiple assets (thanks to the useful
    # multiple-selection functionality in _attachment_fields.html.erb). But our 
    # model only allows one asset per attachment, so we need to flatten out things
    # out by replacing the attachments_attributes portion of the params hash with
    # a new one. 
    if attachments = params[:transfer][:attachments_attributes]
      flattened_attachments = {}
      asset_num = 0
      attachments.each do |attachment|
        attachment_key = attachment.first
        attachments[attachment_key][:asset].each do |asset|
          flattened_attachments[asset_num.to_s] = {asset: asset}
          asset_num += 1
        end
      end
      params[:transfer][:attachments_attributes] = flattened_attachments
    end
    @transfer = Transfer.new(transfer_params)

    @transfer.agreement = @agreement
    @transfer.user = current_user
    @transfer.username = current_user.username
    @transfer.email = current_user.email
    @transfer.first_name = current_user.first_name
    @transfer.last_name = current_user.last_name

    respond_to do |format|
      if @transfer.save
        UserMailer.transfer_confirmation(@transfer).deliver_now
        UserMailer.transfer_notification(@transfer).deliver_now
        format.html { redirect_to([@agreement, @transfer], :notice => 'Transfer was successfully created.') }
        format.xml  { render :xml => [@agreement, @transfer], :status => :created, :location => [@agreement,@transfer] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def transfer_params
      params.require(:transfer).permit(
        :description,
        :username,
        :email,
        :first_name,
        :last_name,
        :user,
        attachments_attributes: [:asset, :_destroy]
      )  
  end
end
