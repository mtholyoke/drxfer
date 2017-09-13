require 'rails_helper'

describe "folders/index.html.erb" do
  before(:each) do
    assign(:folders, [
      stub_model(Folder,
        :path => "Path",
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Folder,
        :path => "Path",
        :name => "Name2",
        :description => "MyText2"
      )
    ])
  end

  it "renders a list of folders" do
    render

    rendered.should include("Name")
    rendered.should include("Name2")
    rendered.should include("MyText")
    rendered.should include("MyText2")
  end
end
