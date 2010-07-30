class ArchivesController < ApplicationController

  def index
    @current_month = Date.today.month - 1
    @selected_month = params[:selected_month].blank? ? @current_month : params[:selected_month].to_i
    @customers = Customer.all
  end
end