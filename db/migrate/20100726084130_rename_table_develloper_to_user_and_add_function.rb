class RenameTableDevelloperToUserAndAddFunction < ActiveRecord::Migration
def self.up
    drop_table :developpers
    create_table :users do |t|
      t.string :name, :null => false
      t.integer :periode_travail
      t.string :function
      t.timestamps
    end
  end

  def self.down
    drop_table :users
     create_table :developpers do |t|
      t.string :nom, :null => false
      t.integer :periode_travail
      t.timestamps
    end
  end
end
