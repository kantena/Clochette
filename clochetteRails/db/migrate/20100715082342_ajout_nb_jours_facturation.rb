class AjoutNbJoursFacturation < ActiveRecord::Migration
  def self.up
    add_column :clients, :jours_a_facturer, :integer, :limit => 31
  end

  def self.down
  end
end
