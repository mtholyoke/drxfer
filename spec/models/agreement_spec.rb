require 'rails_helper'

describe Agreement do
	context "validations" do
		it "is valid with proper values" do    
			expect(FactoryGirl.build(:agreement)).to be_valid
		end

		it "is not valid without a name" do
			expect(FactoryGirl.build(:agreement, :name => nil)).to_not be_valid
		end
  	end

  	context "associations" do
  		it { should belong_to(:folder) }
  		it { should have_many(:assignments) }
  		it { should have_many(:transfers) }
  		it { should have_many(:users).through(:assignments) }
  	end
end
