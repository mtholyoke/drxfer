class Attachment < ActiveRecord::Base
  belongs_to :transfer
  mount_uploader :asset, AttachmentUploader

  before_save :update_asset_attributes
  
  private
  
  def update_asset_attributes
    if asset.present? && asset_changed?
      self.content_type = asset.file.content_type
      self.file_size = asset.file.size
    end
  end
  
end
