require 'rails_helper'

describe "agreements/show.html.erb" do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @agreement = @user.agreements.create(name: "Name")
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
  end
end
