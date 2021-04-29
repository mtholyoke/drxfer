require "rails_helper"

describe UserMailer do
  before (:each) do
    @transfer = stub_model(Transfer,
      :agreement => stub_model(Agreement,
        :id => 1,
        :name => "AgreementName",
        :description => "AgreementDescription",
        :folder => stub_model(Folder,
          :path => "mypath"
        )
      ),
      :user => stub_model(User,
        :first_name => "Test",
        :last_name => "User",
        :email => "user@example.com"
      ),
      :description => "TransferDescription",
      :email => 'user@example.com'
    )
  end
  describe "transfer_confirmation" do 
    let(:mail) { UserMailer.transfer_confirmation(@transfer) }

    it "renders the headers" do
      expect(mail.subject).to eq(Drxfer::Application.config.transfer_confirmation_subject)
      expect(mail.to).to eq(["user@example.com"])
      expect(mail.from).to eq([Drxfer::Application.config.email_notification_from_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear Test")
      expect(mail.body.encoded).to match("We have received the following files")
      expect(mail.body.encoded).to match(/Sincerely,\s+Archives and Special Collections/)
    end    
  end
  describe "transfer_notification" do 
    let(:mail) { UserMailer.transfer_notification(@transfer) }

    it "renders the headers" do
      expect(mail.subject).to eq("A digital records transfer has been received")
      expect(mail.to).to eq(Drxfer::Application.config.transfer_notification_recipient_addresses)
      expect(mail.from).to eq([Drxfer::Application.config.email_notification_from_address])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear Transfer Recipient")
      expect(mail.body.encoded).to match("Test User has made")
      expect(mail.body.encoded).to match(/Transfer agreement:\s+AgreementName/)
      expect(mail.body.encoded).to match(/folder\):\s+mypath/)
      expect(mail.body.encoded).to match(/Transfer description:\s+TransferDescription/)
    end    
  end  
end
