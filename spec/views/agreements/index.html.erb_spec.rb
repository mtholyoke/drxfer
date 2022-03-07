require 'rails_helper'

describe "agreements/index.html.erb" do
  before(:each) do
    @agreement = create(:agreement)
    @agreements = Agreement.all
  end

  it "renders a list of agreements" do
    render template: 'agreements/index', format: [:html]
    expect(rendered).to include(@agreement.name)
  end

end
