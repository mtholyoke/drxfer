require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe TransfersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    folder = FactoryGirl.build(:folder)
    @agreement = FactoryGirl.create(:agreement, folder: folder)
  end

  describe "GET index" do
    it "assigns all transfers as @transfers" do
      transfer = @agreement.transfers.create! attributes_for(:transfer, :user => @user)
      get :index, params: { :agreement => @agreement, :agreement_id => @agreement.id }
      expect(assigns(:transfers)).to eq([transfer])
    end
  end

  describe "GET show" do
    it "assigns the requested transfer as @transfer" do
      transfer = @agreement.transfers.create! attributes_for(:transfer, :user => @user)
      get :show, params: { :agreement => @agreement, :agreement_id => @agreement.id, :id => transfer.id }
      expect(assigns(:transfer)).to eq(transfer)
    end
  end

  describe "GET new" do
    it "assigns a new transfer as @transfer" do
      get :new, params: { :user => @user_id, :agreement => @agreement, :agreement_id => @agreement.id }
      expect(assigns(:transfer)).to be_a_new(Transfer)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Transfer" do
        expect{ 
          post :create, params: { :agreement_id => @agreement.id, :transfer => attributes_for(:transfer, :user_id => @user.id) }
        }.to change(Transfer, :count).by(1)
      end

      it "assigns a newly created transfer as @transfer" do
        post :create, params: { :agreement_id => @agreement.id, :transfer => attributes_for(:transfer, :user_id => @user.id) }
        expect(assigns(:transfer)).to be_a(Transfer)
        expect(assigns(:transfer)).to be_persisted
      end

      it "redirects to the created transfer" do
          post :create, params: { :agreement_id => @agreement.id, :transfer => attributes_for(:transfer, :user_id => @user.id) }
        expect(response).to redirect_to agreement_transfer_path(agreement_id: @agreement.id, id: Transfer.last.id)
      end
    end
    
    context "with invalid params" do
      before do 
        post :create, params: { :agreement_id => @agreement.id, :transfer => attributes_for(:transfer, :description => nil, :user_id => @user.id) }
      end

      it "assigns a newly created but unsaved transfer as @transfer" do
        expect(assigns(:transfer)).to be_a_new(Transfer)
      end

      it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end
  end
end
