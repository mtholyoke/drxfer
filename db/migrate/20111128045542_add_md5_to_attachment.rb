class AddMd5ToAttachment < ActiveRecord::Migration[4.2]
  def self.up
    add_column :attachments, :md5, :string
  end

  def self.down
    remove_column :attachments, :md5
  end
end
