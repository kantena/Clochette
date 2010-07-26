class RenameDevelloperIdInActivityNoteTableToUserId < ActiveRecord::Migration
  def self.up
    rename_column :activity_notes, :developper_id, :user_id
  end

  def self.down
    rename_column :activity_notes, :user_id, :developper_id
  end
end
