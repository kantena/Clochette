class AddFieldDatecreation < ActiveRecord::Migration
  def self.up
    add_column :facturations, :date_creation, :date
  end

  def self.down
  end
end
