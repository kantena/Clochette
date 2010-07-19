class CorrectionNomChampFacturations < ActiveRecord::Migration
  def self.up
    remove_column :facturations, :nb_heures_a_facturer
    add_column :facturations, :nb_jours_a_facturer, :integer
  end

  def self.down
  end
end
