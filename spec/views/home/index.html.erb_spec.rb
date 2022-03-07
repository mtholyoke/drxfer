require 'rails_helper'

describe "home/index.html.erb" do
  before(:each) do
    @user = create(:user)
    sign_in @user
    # @user.agreements.create(name: "Name").transfers.create(description: "Text")
    @agreement = create(:agreement, name: "Name")
    @agreement.transfers.create(description: "Text")
    @user.agreements << @agreement
  end

  it "renders a list of transfers" do
    render template: 'home/index', format: [:html]
    expect(rendered).to include("Name")
  end
end
