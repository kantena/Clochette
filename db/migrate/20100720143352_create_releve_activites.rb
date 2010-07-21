class CreateReleveActivites < ActiveRecord::Migration
  def self.up

    change_table :developpeurs do |d|
      d.remove :periode_travail
    end
 
    create_table :releve_activites do |r|
      r.integer :client_id, :null => true
      r.integer :developpeur_id, :null => true
      r.integer :jours_travail, :default => 0
      r.timestamps
    end
  end

  def self.down
    drop_table :releve_activites
  end
end
