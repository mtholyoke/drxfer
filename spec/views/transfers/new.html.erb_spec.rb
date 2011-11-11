require 'spec_helper'

describe "transfers/new.html.erb" do
  before(:each) do
    assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new transfer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transfers_path, :method => "post" do
      assert_select "input#transfer_agreement_id", :name => "transfer[agreement_id]"
      assert_select "textarea#transfer_description", :name => "transfer[description]"
    end
  end
end
