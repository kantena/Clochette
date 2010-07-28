# coding: utf-8
require 'spec_helper'

describe VacationsController do
  integrate_views

  context "routage des pages" do
    it "should success when we target the index page" do
      get 'index'
      response.should be_success
    end
  end

    it "doit afficher la liste de tous les conges posés pour le mois courant" do
    nicolas = Factory(:kantenien, :name => 'Nicolas')
    bertrand = Factory(:kantenien, :name => 'Bertrand')
    vac1  = Factory(:vacation, :user => nicolas, :vacation_days => 10)
     vac2 = Factory(:vacation, :user => bertrand, :vacation_days => 5)
     get 'index'
     assert response.body.include?('Bertrand : 5'), "Bertrand : 5 n'est pas affiché"
     assert response.body.include?('Nicolas : 10'), "Nicolas : 10 n'est pas affiché"
    end

end
