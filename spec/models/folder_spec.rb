require 'rails_helper'

describe Folder do
	context "validations" do
		subject { create :folder }
 		it { should validate_presence_of(:name) }
		# it { should validate_presence_of(:path) } 
		# it { should validate_uniqueness_of(:name) }
		it { should validate_uniqueness_of(:path) }
		it { should validate_length_of(:name).is_at_most(16) }
		it { should validate_length_of(:path).is_at_least(1) }
		it { should allow_value("/path/path").for(:path) }
		it { should_not allow_value("..").for(:path) }
	end

	context "associations" do
		it { should have_many(:agreements) }
	end
end
