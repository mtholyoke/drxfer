require 'spec_helper'

describe "agreements/show.html.erb" do
  before(:each) do
    @agreement = FactoryGirl.create(:agreement)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
