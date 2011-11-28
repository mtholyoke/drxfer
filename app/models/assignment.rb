class Assignment < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :user
end
