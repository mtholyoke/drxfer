require 'fileutils'

class Folder < ActiveRecord::Base
  has_many :agreements
  before_validation :normalize_path
  validates_uniqueness_of :path, :name
  validates_length_of :name, :maximum => 16
  validates_presence_of :name
  validates_presence_of :path
  validates_length_of :path, :minimum => 1
  validates_format_of :path, :without => /\.\./, :message => 'cannot contain ..'
  validate :path_exists, :path_is_a_folder, :path_writable

  default_scope  { order(:name => :asc) }

  def name_with_description
    if description.nil?
      name
    else
      name + ' (' + description + ')'
    end
  end

  # Remove leading and trailing slashes and whitespace
  def normalize_path
    path.strip!
    path.gsub!(/[\/\\]+$/, '')
    path.gsub!(/^[\/\\]+/, '')
  end

  def full_path
    Drxfer::Application.config.transfer_destination_base_path.to_s + "/" + path
  end

  def path_exists
    if ! File.exist?(full_path)
      begin
        FileUtils.mkdir_p(full_path)
      rescue SystemCallError => e
        errors.add(:path, "does not exist and could not be created: #{e.message}")
        raise ActiveRecord::Rollback
      end
    end
  end

  def path_is_a_folder
    errors.add(:path, "is not a folder") unless File.directory?(full_path)
  end

  def path_writable
    errors.add(:path, "is not writable") unless File.writable?(full_path)
  end
end
