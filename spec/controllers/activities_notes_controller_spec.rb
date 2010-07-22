require 'spec_helper'

describe ActivityNotesController do
  integrate_views

  context "routage des pages" do
    it "affiche la page index" do
      get 'index'
      response.should be_success
    end
    
    it "affiche la page edit" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      activity_note = Factory(:activity_note, :customer => company, :developper => equipier, :working_days => 10 )
      get 'edit', :id => activity_note
      response.should be_success
    end

    it "suppression d'une activité" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      activity_note = Factory(:activity_note, :customer => company, :developper => equipier, :working_days => 10 )
      get 'destroy', :id => activity_note.id
      response.should redirect_to( :action => "index")
      note = ActivityNote.find :all
      assert_equal 0, note.size
    end

    it "affiche la page d'ajout de nouveau compte rendu" do
      get 'new'
      response.should be_success
    end
  end

  context "affichage de la page" do
    it "affiche la liste des sociétés avec le nombre de jours à facturer pour l'equipier" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      Factory(:activity_note, :customer => company, :developper => equipier, :working_days => 10 )
      get 'index'
      response.should be_success
      assert response.body.include?("Vinci"), "Vinci n'apparait pas sur la page"
      assert response.body.include?("Société"), "Société n'apparait pas sur la page"
      assert response.body.include?("Nb jours à facturer : "), "Nb jours a facturer n'apparait pas sur la page"
    end
  end

  context "Enregistrement du nombre de jour de facturation" do
    it "Mets à jourle nombre de jours a facturer pour l'equipier pour une société" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      note =  Factory(:activity_note, :customer => company, :developper => equipier, :working_days => 10 )
      put 'update', :id => note.id , :activity_note => {:working_days => 1}
      response.should redirect_to( :action => "index")
      note_upated = ActivityNote.find note.id
      assert_equal 1, note_upated.working_days
    end

    it "cree un nouveau compte rendu d'activité" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      put 'create',:activity_note => {:working_days => 1, :customer_id => company.id}
      response.should redirect_to( :action => "index")
      note_upated = ActivityNote.find :first
      assert_equal 1, note_upated.working_days
    end
  end
end
  
