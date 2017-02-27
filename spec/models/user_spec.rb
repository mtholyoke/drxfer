require 'spec_helper'

describe User do
	context "associations" do
		it { should have_many(:assignments) }
		it { should have_many(:transfers) }
		it { should have_many(:agreements).through(:assignments) }
	end
end
