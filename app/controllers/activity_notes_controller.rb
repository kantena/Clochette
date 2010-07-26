class ActivityNotesController < ApplicationController
  def index
    @activity_notes = ActivityNote.find_all_by_developper_id session[:developper]
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
    activity_note.developper_id = session[:developper]
    activity_note.working_days = params[:activity_note][:working_days]
    activity_note.customer_id = params[:activity_note][:customer_id]
    today = Date.today
    activity_note.month = today.month.to_i
    activity_note.year = today.year.to_i
    activity_note.save
    redirect_to :action => "index"
  end
end