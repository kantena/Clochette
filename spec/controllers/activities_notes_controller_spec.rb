require 'spec_helper'

describe ActivityNotesController do
  integrate_views

  def setup
    session[:user]= 1
  end

  context "routage des pages" do
    it "affiche la page index" do
      get 'index'
      response.should be_success
    end
    
    it "affiche la page edit" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      activity_note = Factory(:activity_note, :customer => company, :user => equipier, :working_days => 10 )
      get 'edit', :id => activity_note
      response.should be_success
    end

    it "suppression d'une activité" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      activity_note = Factory(:activity_note, :customer => company, :user => equipier, :working_days => 10 )
      get 'destroy', :id => activity_note.id
      response.should redirect_to( :action => "index")
      note = ActivityNote.find :all
      assert_equal 0, note.size
    end

    it "affiche la page d'ajout de nouveau compte rendu" do
      get 'new'
      response.should be_success
    end

    it "appel de l'import à partir de google agenda et redirection vers l'index" do
      Factory(:kantenien, :id => 1, :name =>'nfe')
      get 'index', :mode_chargement => "import"
      response.should be_success
    end
  end

  context "affichage de la page" do
    it "affiche la liste des sociétés avec le nombre de jours à facturer pour l'equipier" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      Factory(:activity_note, :customer => company, :user => equipier, :working_days => 10 )
      put 'index'
      response.should be_success
      assert response.body.include?("Vinci"), "Vinci n'apparait pas sur la page"
      assert response.body.include?("Société"), "Société n'apparait pas sur la page"
      assert response.body.include?("Nb jours à facturer : "), "Nb jours a facturer n'apparait pas sur la page"
    end

    it "affichage des jours facturables après lancement de l'import" do
      societe = Factory(:customer, :name => 'Coya & Co')
      societe_2 = Factory(:customer, :name => 'CdC')
      societe_3 = Factory(:customer, :name => 'Une dernière compagnie')
      dev = Factory(:kantenien, :id => 1, :name =>'nfe')

      Factory(:activity_note, :customer => societe, :user => dev, :working_days => 10, :month => 7, :year => 2010 )
      Factory(:activity_note, :customer => societe_2, :user => dev, :working_days => 5, :month => 7, :year => 2010 )
      Factory(:activity_note, :customer => societe_3, :user => dev, :working_days => 25, :month => 7, :year => 2010 )

      list = []
      event = Event.new
      event.user = "nfe"
      event.title = "CdC"
      event.start_time = Date.civil(2010,7,1)
      event.end_time = Date.civil(2010,7,27)
      list << event
      AgendaGoogle.any_instance.stubs(:list_event).returns(list)
      ActivityNote.import dev.id
      
      get 'index', :mode_chargement => "import"
      response.should be_success
      
      notes = ActivityNote.find_all_by_user_id dev.id
      assert_equal 1, notes.size
    end
  end

  context "Enregistrement du nombre de jour de facturation" do
    it "Mets à jourle nombre de jours a facturer pour l'equipier pour une société" do
      company = Factory(:customer, :name => 'Vinci')
      equipier = Factory(:kantenien, :name =>'nicolas')
      note =  Factory(:activity_note, :customer => company, :user => equipier, :working_days => 10 )
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
  
