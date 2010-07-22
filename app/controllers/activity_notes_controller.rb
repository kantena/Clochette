class ActivityNotesController < ApplicationController
  def index
    @activity_notes = ActivityNote.find_all_by_developper_id 1
  end

  def update
    activity_note = ActivityNote.find params[:id]
    activity_note.working_days = params[:activity_note][:working_days]
    activity_note.save!
    redirect_to :action => "index"
  end

  def edit
    @activity_note = ActivityNote.find params[:id]
  end

  def destroy
    activity_note = ActivityNote.find params[:id]
    activity_note.destroy
    redirect_to :action => "index"
  end
end