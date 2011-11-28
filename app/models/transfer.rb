class Transfer < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank
  
  attr_accessible :description, :username, :email, :first_name, :last_name, :user, :attachment, :attachments_attributes
  validates_presence_of :agreement, :user, :username, :email, :first_name, :last_name
  
  default_scope :order => 'created_at DESC'
  
  def to_s
    created_at.to_s(:long) + 
    ' by ' + first_name + ' ' + last_name
  end
  
  def destination_folder
    return nil unless agreement.folder
    agreement.folder.path + '/' + self.created_at.strftime("%Y-%m-%d_%H%M%S") + "-#{id}"
  end
  
end
