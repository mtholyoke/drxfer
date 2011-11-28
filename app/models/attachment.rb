require 'digest/md5'

class Attachment < ActiveRecord::Base
  belongs_to :transfer
  mount_uploader :asset, AttachmentUploader

  before_save :update_asset_attributes, :calculate_md5_hash
  
  private
  
  def update_asset_attributes
    if asset.present? && asset_changed?
      self.content_type = asset.file.content_type
      self.file_size = asset.file.size
    end
  end
  
  def calculate_md5_hash
    if asset.present?
      self.md5 = Digest::MD5.hexdigest(File.read(asset.current_path))
    end
  end
  
end
