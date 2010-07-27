class CreateGlobalActivityStatesControllers < ActiveRecord::Migration
  def self.up
    add_column :activity_notes, :validation_state, :boolean
    add_column :activity_notes, :global_activity_states_controller_id, :integer

    create_table :global_activity_states_controllers do |t|
      t.integer :customer_id, :null => true
      t.boolean :global_state_of_validations
      t.timestamps
    end
  end

  def self.down
    drop_table :global_activity_states_controllers
  end
end
