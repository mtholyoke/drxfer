require 'digest/md5'
require 'fileutils'

class Attachment < ActiveRecord::Base
  belongs_to :transfer
  mount_uploader :asset, AttachmentUploader

  validates_presence_of :asset
  before_save :check_for_asset, :update_asset_attributes, :calculate_md5_hash, :transfer_file
  after_save :verify_copy, :verify_md5_hash

  def destination
    transfer.destination_folder + '/' + File.basename(asset.current_path)
  end

  private

  def check_for_asset
    unless asset.present?
      raise "Missing asset!"
    end
  end

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

  def transfer_file
    if asset.present?
      FileUtils.mkdir_p(transfer.destination_folder) unless File.exist?(transfer.destination_folder)
      FileUtils.cp(asset.current_path, destination)
    end
  end

  def verify_copy
    raise "File not copied successfully" unless File.exist? destination
  end

  def verify_md5_hash
    unless md5.eql?(Digest::MD5.hexdigest(File.read(destination)))
      raise "MD5 hash of destination does not match intial upload. File may not have copied successfully." +
            "Upload: #{md5} / " +
            "Destination: #{Digest::MD5.hexdigest(File.read(destination))}"
    end
  end
end
