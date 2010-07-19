require 'test_helper'

class FacturationsControllerTest < ActionController::TestCase
  fixtures :facturations
  
  setup do
    @update = {
        :client => 'MyString'
        :nb_jours_a_facturer => 1
        :etat_valide => false
        :facturation_envoyee => false
        :liste_dev_attente_validation => 'MyText'
        :date_archivage => 2010-07-18
        :date_creation => 2010-07-18
    }
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facturations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facturation" do
    assert_difference('Facturation.count') do
      post :create, :facturation => @update
    end

    assert_redirected_to facturation_path(assigns(:facturation))
  end

  test "should show facturation" do
    get :show, :id => facturations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => facturations(:one).to_param
    assert_response :success
  end

  test "should update facturation" do
    put :update, :id => facturations(:one).to_param, :facturation => @update
    assert_redirected_to facturation_path(assigns(:facturation))
  end

  test "should destroy facturation" do
    assert_difference('Facturation.count', -1) do
      delete :destroy, :id => facturations(:one).to_param
    end

    assert_redirected_to facturations_path
  end
end
