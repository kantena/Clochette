class ActivityNotesController < ApplicationController
  def index
    # TODO replace 1 by developper id
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

  def new
  end

  def create
    activity_note = ActivityNote.new
    # TODO replace 1 by developper id
    activity_note.developper_id = 1
    activity_note.working_days = params[:activity_note][:working_days]
    activity_note.customer_id = params[:activity_note][:customer_id]
    activity_note.save
    redirect_to :action => "index"
  end
end