require 'spec_helper'

describe "agreements/index.html.erb" do
  before(:each) do
    FactoryGirl.create(:agreement)
    FactoryGirl.create(:agreement)
  end

  it "renders a list of agreements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
