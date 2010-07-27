class Delete < ActiveRecord::Migration
  def self.up
    remove_column :customers, :global_validation_state_of_activities
  end

  def self.down
  end
end
