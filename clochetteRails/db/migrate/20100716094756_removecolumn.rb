class Removecolumn < ActiveRecord::Migration
  def self.up
	  remove_column :clients, :localisation
  end

  def self.down
  end
end
