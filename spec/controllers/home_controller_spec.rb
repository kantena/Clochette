# coding: utf-8
require 'spec_helper'

describe HomeController do
  integrate_views

  context "routage des pages" do
    it "affiche la page index" do
      get 'index'
      response.should be_success
    end

    it "affiche la page d'ajout d'un nouveau client" do
      get 'new'
      response.should be_success
    end

  end

  describe "#index" do
    it "vérification des assignations" do
      get 'index'
      Object.expects(:all).once
      assert assigns(:customers)
    end
  end

  context "fonctionnalités du controlleur" do
    it "doit créer un nouveau client" do
     post 'create', :customer => {:name => 'Vinci'}
     response.should redirect_to( :action => "index")
     assert_equal 1, Customer.all.size
     assert_equal "Vinci", Customer.first.name
    end

    it "on doit updater les informations d'un client avec succès, appel direct à l'action update" do
      customer1 = Factory(:customer, :name => 'Ancien nom')
      put 'update', :id => customer1, :customer => {:name => 'Nouveau nom'}
      response.should redirect_to( :action => "index")
      assert_equal "Nouveau nom", Customer.first.name
    end

    it "on doit pouvoir supprimer un client de la base" do
      customer1 = Factory(:customer)
      delete 'destroy', :id => customer1
      response.should redirect_to( :action => "index")
      assert_equal 0, Customer.all.size
    end
  end

 
end
  
