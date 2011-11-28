class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :transfer_id
      t.string :asset
      t.string :content_type
      t.integer :file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
