class Agreement < ActiveRecord::Base
  attr_accessible :name, :description
  validates_presence_of :name, :message => 'is required'
  has_many :transfers
end
