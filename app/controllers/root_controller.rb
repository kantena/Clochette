class RootController < ApplicationController

  def index
    @customers = Customer.all
  end
end