require 'rails_helper'

describe "transfers/show.html.erb" do
  before(:each) do
    # @user = FactoryGirl.create(:user)
    # sign_in @user 
    # @user.agreements.create(name: "Name")
    @transfer = assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ))
  end

  skip "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/MyText/)
  end
end
