class CreateVacationNotes < ActiveRecord::Migration
  def self.up
    create_table :vacation_notes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :vacation_notes
  end
end
