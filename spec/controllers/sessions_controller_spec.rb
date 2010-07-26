require 'spec_helper'

describe SessionsController do
  integrate_views

  context "creation d'une session pour un équipier" do
    it "affiche la liste des équipiers " do
      get 'new'
      response.should be_success
    end

    it "creation d'une nouvelle session pour un developpeur" do
      developper = Factory(:kantenien, :name =>'nicolas', :function => 'developper')
      put :update , :id => developper.id
      assert_equal developper.id, session[:user]
      assert_redirected_to activity_notes_url
    end

    it "creation d'une nouvelle session pour angélique" do
      faery = Factory(:kantenien, :name =>'angélique', :function => 'faery')
      put :update , :id => faery.id
      assert_equal faery.id, session[:user]
      assert_redirected_to home_url
    end

    it "redirection a l'écran de logoin en cas d'erreur" do
      put :update , :id => 2234444
      assert_redirected_to login_url
    end


  end

end