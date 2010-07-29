class HomeController < ApplicationController

  def index
    @customers = Customer.all
  end

  def create
    customer = Customer.new
    customer.name = params[:customer][:name]
    customer.save
    redirect_to :action => 'index'
  end

  def update
    customer = Customer.find params[:id]
    customer.name = params[:customer][:name]
    customer.save!
    redirect_to :action => 'index'
  end

  def destroy
    customer = Customer.find params[:id]
    customer.destroy
    redirect_to :action => 'index'
  end

  def new
  end

 end