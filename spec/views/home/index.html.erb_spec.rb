require 'spec_helper'

describe "home/index.html.erb" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @user.agreements.create(name: "Name").transfers.create(description: "Text")
  end

  it "renders a list of transfers" do
    render
    rendered.should include("Name")
  end
end
