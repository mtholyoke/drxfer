require 'rails_helper'

describe AgreementsController do
  before (:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all agreements as @agreements" do
      agreement = create(:agreement)
      get :index
      expect(assigns(:agreements)).to eq([agreement])
    end
  end

  describe "GET show" do
    it "assigns the requested agreement as @agreement" do
      agreement = create(:agreement)
      get :show, params: { :id => agreement.id.to_s }
      expect(assigns(:agreement)).to eq(agreement)
    end
  end

  describe "GET new" do
    it "assigns a new agreement as @agreement" do
      get :new
      expect(assigns(:agreement)).to be_a_new(Agreement)
    end
  end

  describe "GET edit" do
    it "assigns the requested agreement as @agreement" do
      agreement = create(:agreement)
      get :edit, params: { :id => agreement.id.to_s }
      expect(assigns(:agreement)).to eq(agreement)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Agreement" do
        expect {
          post :create, params: { :agreement => attributes_for(:agreement).merge(folder_id: create(:folder)) }
        }.to change(Agreement, :count).by(1)
      end

      it "assigns a newly created agreement as @agreement" do
        post :create, params: { :agreement => attributes_for(:agreement).merge(folder_id: create(:folder)) }
        expect(assigns(:agreement)).to be_a(Agreement)
        expect(assigns(:agreement)).to be_persisted
      end

      it "redirects to the created agreement" do
        post :create, params: { :agreement => attributes_for(:agreement).merge(folder_id: create(:folder)) }
        expect(response).to redirect_to(Agreement.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved agreement as @agreement" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, params: { :agreement => { :name => "" } }
        expect(assigns(:agreement)).to be_a_new(Agreement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, params: { :agreement => { :name => "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested agreement" do
        agreement = create(:agreement)
        put :update, params: { :id => agreement.id.to_s, :agreement => { name: "New name" } }
        agreement.reload
        expect(agreement).to have_attributes(:name => "New name")
      end

      it "assigns the requested agreement as @agreement" do
        agreement = create(:agreement)
        put :update, params: { :id => agreement.id.to_s, :agreement => { name: "New name" } }
        expect(assigns(:agreement)).to eq(agreement)
      end

      it "redirects to the agreement" do
        agreement = create(:agreement)
        put :update, params: { :id => agreement.id.to_s, :agreement => { name: "New name" } }
        expect(response).to redirect_to(agreement)
      end
    end

    context "with invalid params" do
      it "assigns the agreement as @agreement" do
        agreement = create(:agreement)
        put :update, params: { :id => agreement.id.to_s, :agreement => { :name => "" } }
        expect(assigns(:agreement)).to eq(agreement)
      end

      it "re-renders the 'edit' template" do
        agreement = create(:agreement)
        put :update, params: { :id => agreement.id.to_s, :agreement => { :name => "" } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested agreement" do
      agreement = create(:agreement)
      expect {
        delete :destroy, params: { :id => agreement.id.to_s }
      }.to change(Agreement, :count).by(-1)
    end

    it "redirects to the agreements list" do
      agreement = create(:agreement)
      delete :destroy, params: { :id => agreement.id.to_s }
      expect(response).to redirect_to(agreements_url)
    end
  end

end
