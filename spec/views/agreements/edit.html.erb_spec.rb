require 'spec_helper'

describe "agreements/edit.html.erb" do
  before(:each) do
    @agreement = FactoryGirl.create(:agreement)
  end

  it "renders the edit agreement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agreements_path(@agreement), :method => "post" do
      assert_select "input#agreement_name", :name => "agreement[name]"
      assert_select "textarea#agreement_description", :name => "agreement[description]"
    end
  end
end
