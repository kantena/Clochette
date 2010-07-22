class RootController < ApplicationController

  def index
    @customer = Customer.all
  end
end