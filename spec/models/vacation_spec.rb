# coding: utf-8 
require 'spec_helper'

describe Vacation do
  describe "should return the number of vacation days for a given month and year" do

    it "ne retourne rien si personne n'a posé de jours de congés pour le mois en cours" do
      conges = Vacation.list_for_current_month
      assert_equal 0, conges.size
    end

    it "doit retourner la liste des conges si quelqu'un a posé des congés pour le mois en cours" do
      Factory(:vacation)
      conges = Vacation.list_for_current_month
      assert_equal 1, conges.size
    end
  end



end

