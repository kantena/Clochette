require 'spec_helper'
require 'spec/test/unit'

describe PagesController do
  
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end
  
  describe "#infos_facturation" do

    it "chargement de la page sur les informations de facturation" do
      get 'infos_facturation'
      response.should be_success
    end
    
    it "accessibilite aux bases de donnees" do
      assert_not_nil(Client, "la table clients n'est pas accessible")
    end
    
  end
end
