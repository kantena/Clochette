class CreateClients < ActiveRecord::Migration
  def self.up
    
    create_table :clients do |t|
      t.string :nom
      t.text :description
      t.text :infos_projets
      t.boolean :client_ce_mois

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
