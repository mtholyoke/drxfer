require 'spec_helper'

describe "transfers/show.html.erb" do
  before(:each) do
    @transfer = assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
