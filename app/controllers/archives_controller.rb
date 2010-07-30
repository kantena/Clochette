class ArchivesController < ApplicationController

  def index
    @today = Date.today.month - 1
    @selected_month = @today
    @customers = Customer.all
  end

  def show
    @customers = Customer.all
    @selected_month = params[:id].to_i
    @selected_month = 13 + @selected_month if @selected_month < 0
    @today = Date.today.month - 1
    render :action => "index"
  end
end