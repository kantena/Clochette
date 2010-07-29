class VacationsController < ApplicationController

  def index
    @vacations = Vacation.list_for_current_month
  end
end

