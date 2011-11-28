class Transfer < ActiveRecord::Base
  attr_accessible :description, :username, :email, :first_name, :last_name, :user
  belongs_to :agreement
  belongs_to :user
  validates_presence_of :agreement, :user, :username, :email, :first_name, :last_name
  
  def to_s
    created_at.to_s(:long) + ' by ' + first_name + ' ' + last_name
  end
end
