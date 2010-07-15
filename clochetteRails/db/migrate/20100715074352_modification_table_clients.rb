class ModificationTableClients < ActiveRecord::Migration
  def self.up
    remove_column :clients, :name
    add_column :clients, :nom, :string
  end

  def self.down
    drop_table :clients
  end
end
