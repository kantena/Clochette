class PagesController < ApplicationController
  
  def infos_facturation
     @infos_clients = {}    
     Client.all.each do |client|
      @infos_clients.store(client.nom, client.jours_a_facturer_mois_courant)
    end 
    @mois_courant = 'Juillet'
  end
  
  def infos_facturation_mois_dernier
    @infos_clients = {}    
     Client.all.each do |client|
      @infos_clients.store(client.nom, client.jours_a_facturer_mois_courant)
     end 
    @mois_courant = 'Juin'
  end
   
   def authentification
   end
  
   def fonctionnalites_angelique
   end
   
end
