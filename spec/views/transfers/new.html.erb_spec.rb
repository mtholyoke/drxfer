require 'rails_helper'

describe "transfers/new.html.erb" do
  before(:each) do
    assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  skip "renders new transfer form" do
    render agreement_transfer_path(agreement_id: 1, id: :transfer.id)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agreement_transfer_path, :method => "post" do
      assert_select "input#transfer_agreement_id", :name => "transfer[agreement_id]"
      assert_select "textarea#transfer_description", :name => "transfer[description]"
    end
  end
end
