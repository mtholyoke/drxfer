require 'spec_helper'

describe Assignment do
	context "associations" do
  		it { should belong_to(:user) }
  		it { should belong_to(:agreement) }
  	end
end
