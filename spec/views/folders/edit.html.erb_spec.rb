require 'spec_helper'

describe "folders/edit.html.erb" do
  before(:each) do
    @folder = assign(:folder, stub_model(Folder,
      :path => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit folder form" do
    render

    assert_select "form", :action => folders_path(@folder), :method => "post" do
      assert_select "input#folder_name", :name => "folder[name]"
      assert_select "textarea#folder_description", :name => "folder[description]"
    end
  end
end
