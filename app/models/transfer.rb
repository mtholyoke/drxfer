class Transfer < ActiveRecord::Base
  belongs_to :agreement
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank
  
  validates_presence_of :agreement, :user, :description, :username, :email, :first_name, :last_name
  
  default_scope  { order(:created_at => :desc) }
  
  def to_s
    created_at.to_s(:long) + 
    ' by ' + first_name + ' ' + last_name
  end
  
  def files_count
    "#{attachments.size} file" + (attachments.size == 1 ? '' : 's')
  end
  
  def files_size
    attachments.sum(:file_size)
  end
  
  def destination_folder
    return nil unless agreement.folder
    agreement.folder.full_path + '/' +
    self.created_at.strftime("%Y-%m-%d_%H%M%S") + "-#{id}"
  end
end