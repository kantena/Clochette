
class PagesController < ApplicationController
  def infos_facturation
     @clients = Client.all
  end
  
end
