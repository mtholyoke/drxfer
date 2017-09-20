class CreateFolders < ActiveRecord::Migration[4.2]
  def self.up
    create_table :folders do |t|
      t.string :path, :unique => true
      t.string :name
      t.text :description

      t.timestamps
    end

    add_column :agreements, :folder_id, :integer
  end

  def self.down
    remove_column :agreements, :folder_id
    drop_table :folders
  end
end
