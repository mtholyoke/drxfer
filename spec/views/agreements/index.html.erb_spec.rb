require 'spec_helper'

describe "agreements/index.html.erb" do
  before(:each) do
    @agreement = FactoryGirl.create(:agreement)
    @agreements = Agreement.all
    # FactoryGirl.crea  te(:agreement)
  end

  it "renders a list of agreements" do
    render
    rendered.should contain("Name")
  end

end
