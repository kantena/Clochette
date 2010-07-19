class AddFiledFacturation < ActiveRecord::Migration
  def self.up
    add_column :facturations, :client, :string
  end

  def self.down
  end
end
