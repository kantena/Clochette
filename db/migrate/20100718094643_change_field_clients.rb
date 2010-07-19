class ChangeFieldClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :client_ce_mois
    add_column :clients, :client_ce_mois?, :boolean
    remove_column :travail_developpeurs, :validation_nb_jours_travail
    add_column :travail_developpeurs, :validation_nb_jours_travail?, :boolean
  end

  def self.down
  end
end
