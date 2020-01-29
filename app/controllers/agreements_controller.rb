class AgreementsController < ApplicationController
  # GET /agreements
  # GET /agreements.xml
  def index
    @agreements = Agreement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agreements }
    end
  end

  # GET /agreements/1
  # GET /agreements/1.xml
  def show
    @agreement = Agreement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agreement }
    end
  end

  # GET /agreements/new
  # GET /agreements/new.xml
  def new
    @agreement = Agreement.new
    @users = User.all
    @folders = Folder.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agreement }
    end
  end

  # GET /agreements/1/edit
  def edit
    @agreement = Agreement.find(params[:id])
    @users = User.all
    @folders = Folder.all
  end

  # POST /agreements
  # POST /agreements.xml
  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.attributes = agreement_params.to_h

    @users = User.all
    @folders = Folder.all

    respond_to do |format|
      if @agreement.save
        format.html { redirect_to(@agreement, :notice => 'Agreement was successfully created.') }
        format.xml  { render :xml => @agreement, :status => :created, :location => @agreement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agreements/1
  # PUT /agreements/1.xml
  def update
    @agreement = Agreement.find(params[:id])
    @agreement.attributes = agreement_params.to_h

    @users = User.all
    @folders = Folder.all

    respond_to do |format|
      if @agreement.update(agreement_params)
        format.html { redirect_to(@agreement, :notice => 'Agreement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agreements/1
  # DELETE /agreements/1.xml
  def destroy
    @agreement = Agreement.find(params[:id])
    raise "Cannot delete agreements against which transfers have already been made" if @agreement.transfers.size > 0
    @agreement.destroy

    respond_to do |format|
      format.html { redirect_to(agreements_url) }
      format.xml  { head :ok }
    end
  end

  private

  def agreement_params
    params.require(:agreement).permit(:name, :description, :folder_id, { user_ids:[] })
  end
end
