class AddUserFieldsToTransfer < ActiveRecord::Migration
  def self.up
    add_column :transfers, :user_id, :integer
    add_column :transfers, :username, :string
    add_column :transfers, :email, :string
    add_column :transfers, :first_name, :string
    add_column :transfers, :last_name, :string
  end

  def self.down
    remove_column :transfers, :last_name
    remove_column :transfers, :first_name
    remove_column :transfers, :email
    remove_column :transfers, :username
    remove_column :transfers, :user_id
  end
end
