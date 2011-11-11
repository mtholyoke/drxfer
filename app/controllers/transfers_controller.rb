class TransfersController < ApplicationController
  # GET /transfers
  # GET /transfers.xml
  def index
    @transfers = Transfer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transfers }
    end
  end

  # GET /transfers/1
  # GET /transfers/1.xml
  def show
    @transfer = Transfer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transfer }
    end
  end

  # GET /transfers/new
  # GET /transfers/new.xml
  def new
    @transfer = Transfer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transfer }
    end
  end

  # GET /transfers/1/edit
  def edit
    @transfer = Transfer.find(params[:id])
  end

  # POST /transfers
  # POST /transfers.xml
  def create
    @transfer = Transfer.new(params[:transfer])

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to(@transfer, :notice => 'Transfer was successfully created.') }
        format.xml  { render :xml => @transfer, :status => :created, :location => @transfer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transfer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transfers/1
  # PUT /transfers/1.xml
  def update
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
    @transfer = Transfer.find(params[:id])
    @transfer.destroy

    respond_to do |format|
      format.html { redirect_to(transfers_url) }
      format.xml  { head :ok }
    end
  end
end
