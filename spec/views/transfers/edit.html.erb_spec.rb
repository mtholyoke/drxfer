require 'spec_helper'

describe "transfers/edit.html.erb" do
  before(:each) do
    @transfer = assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit transfer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transfers_path(@transfer), :method => "post" do
      assert_select "input#transfer_agreement_id", :name => "transfer[agreement_id]"
      assert_select "textarea#transfer_description", :name => "transfer[description]"
    end
  end
end
