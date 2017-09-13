require 'rails_helper'

describe "transfers/index.html.erb" do
  before(:each) do
    # @user = FactoryGirl.create(:user) 
    # sign_in @user 
    # @user.agreements.create(name: "Name")
    assign(:transfers, [
      stub_model(Transfer,
        :agreement_id => 1,
        :description => "MyText"
      ),
      stub_model(Transfer,
        :agreement_id => 1,
        :description => "MyText"
      )
    ])
  end

  skip "renders a list of transfers" do
    render 
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
