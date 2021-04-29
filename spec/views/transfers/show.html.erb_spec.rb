require 'rails_helper'

describe "transfers/show.html.erb" do

  before(:each) do
    @user = create(:user, :admin => true )
    sign_in @user    
    @transfer = assign(:transfer, stub_model(Transfer,
      :agreement => assign(:agreement, stub_model(Agreement,
                      :id => 1,
                      :name => "AgreementName",
                      :description => "AgreementDescription"
                    )),
      :description => "TransferDescription",
      :email => 'spec@example.com'
    ))
  end

  it "renders attributes in <p>" do
    render template: 'transfers/show.html.erb', agreement: @agreement, transfer: @transfer, agreement_id: 1
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/AgreementName/)
    expect(rendered).to match(/TransferDescription/)
    expect(rendered).to match(/spec@example.com/)
  end
end
