class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :first_name, :null => false, :limit => 25
      t.string :last_name, :null => false, :limit => 50
      t.string :email, :default => "", :null => false
      t.string :username, :limit => 25
      t.integer :zip_code, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
