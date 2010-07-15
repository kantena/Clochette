
class PagesController < ApplicationController
  def infos_facturation
     @infos_clients = {}    
     Client.all.each do |client|
       @infos_clients.store(client.nom, client.jours_a_facturer)
     end 
  end
  
end
