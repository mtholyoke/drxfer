class Agreement < ActiveRecord::Base
  validates_presence_of :name, :message => 'is required'
  has_many :assignments  
  has_many :users, :through => :assignments
  has_many :transfers
  belongs_to :folder
  
  def users_summary 
    if users.size == 0
      "None assigned"
    elsif users.size < 3
      users.collect{|u| u.full_name}.join(' and ')
    elsif users.size > 2
      users.first.full_name + ', ' + 
      users.all[1].full_name + 
      ', and ' + (users.size - 2).to_s + ' other' +
      (users.size > 3 ? 's' : '') + '.'
    end
  end
end