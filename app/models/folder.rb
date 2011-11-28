require 'fileutils'

class Folder < ActiveRecord::Base
  attr_accessible :path, :name, :description    
  has_many :agreements
  before_validation :normalize_path
  validates_uniqueness_of :path, :name
  validate :path_exists, :path_is_a_folder, :path_writable
    
  default_scope :order => 'path ASC'  
  
  # Remove trailing slashes and leading and trailing whitespace
  def normalize_path
    path.strip!
    path.gsub!(/[\/\\]$/, '')
  end  
    
  def path_exists
    if ! File.exist?(path)
      begin  
        FileUtils.mkdir_p(path)
      rescue SystemCallError => e
        errors.add(:path, "does not exist and could not be created: #{e.message}") 
        raise ActiveRecord::Rollback 
      end
    end
  end

  def path_is_a_folder
    errors.add(:path, "is not a folder") unless File.directory?(path)
  end

  def path_writable
    errors.add(:path, "is not writable") unless File.writable?(path)
  end
end