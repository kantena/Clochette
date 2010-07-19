class CreateTravailDeveloppeurs < ActiveRecord::Migration
  def self.up
    create_table :travail_developpeurs do |t|
      t.string :client
      t.string :nom_developpeur
      t.integer :nb_jours_travail
      t.boolean :validation_nb_jours_travail

      t.timestamps
    end
  end

  def self.down
    drop_table :travail_developpeurs
  end
end
