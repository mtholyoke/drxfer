require 'rails_helper'

describe "agreements/new.html.erb" do
  before(:each) do
    assign(:agreement, stub_model(Agreement,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
    @users = User.all
  end

  it "renders new agreement form" do
    render template: 'agreements/new', format: [:html]

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => agreements_path, :method => "post" do
      assert_select "input#agreement_name", :name => "agreement[name]"
      assert_select "textarea#agreement_description", :name => "agreement[description]"
    end
  end
end
