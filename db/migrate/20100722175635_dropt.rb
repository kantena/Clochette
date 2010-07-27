class Dropt < ActiveRecord::Migration
  def self.up
    drop_table :global_activity_states_controllers
    add_column :customers, :global_validation_state_of_activities, :boolean
    remove_column :activity_notes, :global_controller
  end

  def self.down
  end
end
