class ClientRenommeChampJoursFacturation < ActiveRecord::Migration
  def self.up
	remove_column :clients, :jours_a_facturer
	add_column :clients, :jours_a_facturer_mois_courant, :integer 
  end

  def self.down
  end
end
