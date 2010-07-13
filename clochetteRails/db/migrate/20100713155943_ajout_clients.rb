class AjoutClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :mon_champ, :string
  end

  def self.down
    remove_column :clients, :mon_champ
  end
end
