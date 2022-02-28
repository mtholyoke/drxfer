require 'rails_helper'

describe "transfers/new.html.erb" do
  before(:each) do
    assign(:agreement, stub_model(Agreement,
      :id => 1,
      :name => "MyString",
      :description => "MyText"
    ))
    assign(:transfer, stub_model(Transfer,
      :agreement_id => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new transfer form" do
    render template: 'transfers/new', format: [:html], agreement: @agreement, transfer: @transfer, agreement_id: 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agreement_transfers_path(1), :method => "post" do
      assert_select "a.add_fields[data-association='attachment']"
      assert_select "textarea#transfer_description", :name => "transfer[description]"
    end
  end
end
