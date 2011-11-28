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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transfer }
    end
  end

  # GET /transfers/1/edit
  def edit
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.find(params[:id])
  end

  # POST /transfers
  # POST /transfers.xml
  def create
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.new(params[:transfer])
    @transfer.agreement = @agreement
    @transfer.user = current_user
    @transfer.username = current_user.username
    @transfer.email = current_user.email
    @transfer.first_name = current_user.first_name
    @transfer.last_name = current_user.last_name

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to([@agreement, @transfer], :notice => 'Transfer was successfully created.') }
        format.xml  { render :xml => [@agreement, @transfer], :status => :created, :location => [@agreement,@transfer] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transfers/1
  # PUT /transfers/1.xml
  def update
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.find(params[:id])

    respond_to do |format|
      if @transfer.update_attributes(params[:transfer])
        format.html { redirect_to(@transfer, :notice => 'Transfer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.xml
  def destroy
    @agreement = Agreement.find(params[:agreement_id])
    @transfer = Transfer.find(params[:id])
    @transfer.destroy

    respond_to do |format|
      format.html { redirect_to(transfers_url) }
      format.xml  { head :ok }
    end
  end
end
