class AjoutChampsMonthYear < ActiveRecord::Migration
  def self.up
    add_column :activity_notes, :month, :integer
    add_column :activity_notes, :year, :integer
  end

  def self.down
  end
end
