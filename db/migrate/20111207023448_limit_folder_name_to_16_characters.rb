class LimitFolderNameTo16Characters < ActiveRecord::Migration[4.2]
  def self.up
    change_column :folders, :name, :string, :limit => 16
  end

  def self.down
    change_column :folders, :name, :string, :limit => nil
  end
end
