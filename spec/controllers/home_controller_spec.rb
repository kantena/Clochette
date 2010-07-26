require 'spec_helper'

describe HomeController do
  integrate_views

  context "routage des pages" do
    it "affiche la page index" do
      get 'index'
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
end
  
