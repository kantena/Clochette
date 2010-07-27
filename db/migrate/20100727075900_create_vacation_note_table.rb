class CreateVacationNoteTable < ActiveRecord::Migration
  def self.up
    create_table :vacation_notes do |t|
      t.integer :customer_id, :null => true
      t.integer :vacation_days, :default => 0
      t.integer :month
      t.integer :year
    end
  end

  def self.down
    drop_table :vacation_notes
  end
end
