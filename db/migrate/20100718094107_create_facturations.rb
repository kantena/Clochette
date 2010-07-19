class CreateFacturations < ActiveRecord::Migration
  def self.up
    create_table :facturations do |t|
      t.integer :nb_heures_a_facturer
      t.boolean :etat_valide?
      t.boolean :facturation_envoyee?
      t.text :liste_dev_attente_validation
      t.date :date_archivage

      t.timestamps
    end
  end

  def self.down
    drop_table :facturations
  end
end
