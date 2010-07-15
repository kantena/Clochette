class SuppressionMonChamp < ActiveRecord::Migration
  def self.up
    remove_column :clients, :mon_champ
  end

  def self.down
    raise "non reversible"
  end
end
