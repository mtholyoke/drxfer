require 'spec_helper'

describe HomeController do
  # before (:each) do
  #   @user = FactoryGirl.create(:user)
  #   sign_in @user
  # end

  describe "GET 'index'" do
    describe "when user is signed in" do 
      it "should be successful" do
        @user = FactoryGirl.create(:user)
        sign_in @user
        get 'index'
        expect(response).to be_success
      end
    end

    describe "when user is not signed in" do
      it "should not be successful" do 
        get 'index'
        expect(response).to_not be_success
      end

      it "should redirect to login page" do
        get 'index' 
        expect(response).to redirect_to("/users/login")
      end
    end
  end

end
