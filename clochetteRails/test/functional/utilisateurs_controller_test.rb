require 'test_helper'

class UtilisateursControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:utilisateurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create utilisateur" do
    assert_difference('Utilisateur.count') do
      post :create, :utilisateur => { }
    end

    assert_redirected_to utilisateur_path(assigns(:utilisateur))
  end

  test "should show utilisateur" do
    get :show, :id => utilisateurs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => utilisateurs(:one).to_param
    assert_response :success
  end

  test "should update utilisateur" do
    put :update, :id => utilisateurs(:one).to_param, :utilisateur => { }
    assert_redirected_to utilisateur_path(assigns(:utilisateur))
  end

  test "should destroy utilisateur" do
    assert_difference('Utilisateur.count', -1) do
      delete :destroy, :id => utilisateurs(:one).to_param
    end

    assert_redirected_to utilisateurs_path
  end
end
