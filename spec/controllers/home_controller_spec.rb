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

    it "test du lien d'ajout d'un nouveau client" do
      pending
      get 'index'
      click_link "Ajout d'un nouveau client Kantena"
      response.should redirect_to(:action => "new")
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
     put 'create', :customer => {:name => 'Vinci'}
     response.should redirect_to( :action => "index")
     assert_equal 1, Customer.all.size
     assert_equal "Vinci", Customer.first.name
    end

    it "on doit updater les informations d'un client avec succès, appel direct à l'action update" do
      customer1 = Factory(:customer, :name => 'Ancien nom')
      put 'update', :id => customer1, :customer => {:name => 'Nouveau nom'}
      assert_equal "Nouveau nom", Customer.first.name
    end

    it "on doit pouvoir supprimer un client de la base" do
      customer1 = Factory(:customer)
      put 'destroy', :id => customer1
      assert_equal 0, Customer.all.size
    end
  end

  context "edition des informations relatives à un client" do

    it "on doit créer un nouveau client en remplissant les champs d'informations de la page new" do
      get 'new'
      response.should be_success
      fill_in "customer[name]", :with => "Vinci"
      pending
      click_button "Enregistrer"
      response.should redirect_to(:action => 'index')
      assert_equal 1, Customer.all.size
    end
  end

end
  
