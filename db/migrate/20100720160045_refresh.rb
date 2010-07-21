class Refresh < ActiveRecord::Migration
  def self.up
    drop_table :clients
    drop_table :developpeurs
    drop_table :releve_activites
  end

  create_table :activity_notes do |r|
    r.integer :customer_id, :null => true
    r.integer :developper_id, :null => true
    r.integer :working_days, :default => 0
    r.timestamps
  end

  create_table :customers do |c|
    c.string :name, :null => false
    c.timestamps
  end

  create_table :developpers do |d|
      d.string :name, :null => false
      d.timestamps
  end

  def self.down
  end
end
