class CreateAgreements < ActiveRecord::Migration[4.2]
  def self.up
    create_table :agreements do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :agreements
  end
end
