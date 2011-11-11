class Transfer < ActiveRecord::Base
  attr_accessible :description
  belongs_to :agreement
end
