require 'rails_helper'

describe Attachment do
	context "validations" do
		it { should validate_presence_of(:asset) }
	end

	context "associations" do
		it { should belong_to(:transfer) }
	end
end
