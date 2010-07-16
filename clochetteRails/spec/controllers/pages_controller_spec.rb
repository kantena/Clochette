
require 'spec_helper'

#PagesControlleur est le controlleur en charge de l'affichage des pages dynamiques de l'application
describe PagesController do
  integrate_views

  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end
  
  
  describe "#infos_facturation" do
    #tests controlleur pour la page infos_facturation
    it "chargement de la page sur les informations de facturation sans paramètres" do
      get 'infos_facturation'
      response.should be_success
      response.should have_tag('title',"Informations facturation")
    end
    
    it "accessibilite aux bases de donnees" do
      assert_not_nil(Client, "la table clients n'est pas accessible")
    end
    
  end
  
  describe "#infos_facturation_mois_dernier" do
    #tests controlleur pour la page infos_facturation
    it "chargement de la page sur les informations de facturation du mois dernier sans paramètres" do
      get 'infos_facturation_mois_dernier'
      response.should be_success
      response.should have_tag('title',"Informations facturation mois dernier")
    end    
  end
  
  describe "#authentification" do
    test "chargement de la page d'authentification, login et mot de passe" do
      get 'authentification'
      response.should be_success
      response.should have_tag('title',"Authentification de l'utilisateur")
    end
    
  end
  
  describe "#fonctionnalites_angelique" do
    test "chargement de la page fonctionnalites d'angelique" do
      get 'fonctionnalites_angelique'
      response.should be_success
      response.should have_tag('title',"Fonctionnalites pour Angelique")
    end
    
  end
  
end
