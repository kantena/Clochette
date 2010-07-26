class HomeController < ApplicationController

  def index
    @customers = Customer.all
  end
end