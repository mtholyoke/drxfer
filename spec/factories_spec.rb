require 'rails_helper'

FactoryGirl.factories.map(&:name).each do |factory_name|
	if factory_name.eql? :transfer 
		describe "The transfer factory" do
			it 'is valid' do
				expect(build(:transfer, user: FactoryGirl.create(:user), agreement_id: FactoryGirl.create(:agreement).id)).to be_valid
			end
		end
	else 
	  	describe "The #{factory_name} factory" do
	    	it 'is valid' do
	     		expect(build(factory_name)).to be_valid
	     	end
	  	end
	end	
end