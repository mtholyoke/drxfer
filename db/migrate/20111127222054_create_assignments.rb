class CreateAssignments < ActiveRecord::Migration[4.2]
  def self.up
    create_table :assignments do |t|
      t.integer :agreement_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
