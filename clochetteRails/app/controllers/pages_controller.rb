class PagesController < ApplicationController
  include PagesHelper
    
  def root
    @page_title='Page principale'
  end

  def authentification
    #TODO: implémenter système authentification
    @page_title='Authentification'
    redirect_to :action => 'main_angelique' if sleep 2
  end
  
  def main_angelique
    @page_title="Page principale d'angelique"
    @infos_client_mois_courant = {}
    Client.all.each do | client |
      @infos_client_mois_courant.store(client.nom, recherche_nb_jours_a_facturer_par_nom_client(client.nom))
    end
  end
   
  def main_developpeurs
    @page_title='Page principale pour les développeurs'
  end
   
  def ang_gestion_facturations 
    #TODO: refactoring
    @page_title='Gestion des facturations'
    @infos_client_mois_courant = {}
    Client.all.each do | client |
      @infos_client_mois_courant.store(client.nom, recherche_nb_jours_a_facturer_par_nom_client(client.nom))
    end
  end
   
end
