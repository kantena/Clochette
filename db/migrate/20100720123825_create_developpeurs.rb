class CreateDeveloppeurs < ActiveRecord::Migration
  def self.up
    
    create_table :developpeurs do |t|
      t.string :nom, :null => false
      t.integer :periode_travail
      t.timestamps
    end
  end

  def self.down
    drop_table :developpeurs
  end
end
