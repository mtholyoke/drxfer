require 'spec_helper'

describe Agreement do
	context "validations" do
		it "is valid with proper values" do    
			FactoryGirl.build(:agreement).should be_valid
		end

		it "is not valid without a name" do
			FactoryGirl.build(:agreement, :name => nil).should_not be_valid
		end
  	end

  	context "associations" do
  		it { should belong_to(:folder) }
  		it { should have_many(:assignments) }
  		it { should have_many(:transfers) }
  		it { should have_many(:users).through(:assignments) }
  	end
end
