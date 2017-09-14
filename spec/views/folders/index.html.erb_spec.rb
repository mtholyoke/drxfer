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

    expect(rendered).to include("Name")
    expect(rendered).to include("Name2")
    expect(rendered).to include("MyText")
    expect(rendered).to include("MyText2")
  end
end
