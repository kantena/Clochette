class RmcolumnActivityNote < ActiveRecord::Migration
  def self.up
    remove_column :activity_notes, :global_activity_states_controller_id
  end

  def self.down
  end
end
