require 'test_helper'

class TravailDeveloppeursControllerTest < ActionController::TestCase
  fixtures :travail_developpeurs
  
  setup do
    @update = {
        :client => 'MyString',
        :nom_developpeur => 'MyString',
        :nb_jours_travail => 1,
        :validation_nb_jours_travail => false,
        :mois => 'Juillet',
        :année => 2010
    }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travail_developpeurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travail_developpeur" do
    assert_difference('TravailDeveloppeur.count') do
      post :create, :travail_developpeur => { }
    end

    assert_redirected_to travail_developpeur_path(assigns(:travail_developpeur))
  end

  test "should show travail_developpeur" do
    get :show, :id => travail_developpeurs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => travail_developpeurs(:one).to_param
    assert_response :success
  end

  test "should update travail_developpeur" do
    put :update, :id => travail_developpeurs(:one).to_param, :travail_developpeur => { }
    assert_redirected_to travail_developpeur_path(assigns(:travail_developpeur))
  end

  test "should destroy travail_developpeur" do
    assert_difference('TravailDeveloppeur.count', -1) do
      delete :destroy, :id => travail_developpeurs(:one).to_param
    end

    assert_redirected_to travail_developpeurs_path
  end
end
