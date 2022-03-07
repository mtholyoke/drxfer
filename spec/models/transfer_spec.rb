require 'rails_helper'

describe Transfer do
	context "validations" do
		it { should accept_nested_attributes_for(:attachments) }
		it { should validate_presence_of(:agreement) }
		it { should validate_presence_of(:user) }
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
	end

	context "associations" do
		it { should belong_to(:agreement) }
		it { should belong_to(:user) }
		it { should have_many(:attachments) }
	end
end
