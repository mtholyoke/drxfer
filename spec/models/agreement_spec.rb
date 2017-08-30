require 'spec_helper'

describe Agreement do
	context "validations" do
		it "is valid with proper values" do    
			agreement = Agreement.new :name =>"Name"
			agreement.should be_valid
		end

		it "is not valid without a name" do
			agreement = Agreement.new 
			agreement.should_not be_valid
			agreement.errors_on(:name).should include "is required"
		end
  	end

  	context "associations" do
  		it { should belong_to(:folder) }
  		it { should have_many(:assignments) }
  		it { should have_many(:transfers) }
  		it { should have_many(:users).through(:assignments) }
  	end
end
