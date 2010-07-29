class CreateVacationTable < ActiveRecord::Migration
  def self.up
    create_table :vacations do |t|
      t.integer :user_id, :null => true
      t.integer :vacation_days, :default => 0
      t.integer :month
      t.integer :year
    end
  end

  def self.down
    drop_table :vacations
  end
end
