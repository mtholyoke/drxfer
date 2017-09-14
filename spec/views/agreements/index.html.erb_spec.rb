require 'rails_helper'

describe "agreements/index.html.erb" do
  before(:each) do
    @agreement = FactoryGirl.create(:agreement)
    @agreements = Agreement.all
  end

  it "renders a list of agreements" do
    render
    expect(rendered).to include(@agreement.name)
  end

end
