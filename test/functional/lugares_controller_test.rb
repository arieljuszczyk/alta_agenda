require 'test_helper'

class LugaresControllerTest < ActionController::TestCase
  setup do
    @lugar = lugares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lugares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lugar" do
    assert_difference('Lugar.count') do
      post :create, lugar: @lugar.attributes
    end

    assert_redirected_to lugar_path(assigns(:lugar))
  end

  test "should show lugar" do
    get :show, id: @lugar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lugar
    assert_response :success
  end

  test "should update lugar" do
    put :update, id: @lugar, lugar: @lugar.attributes
    assert_redirected_to lugar_path(assigns(:lugar))
  end

  test "should destroy lugar" do
    assert_difference('Lugar.count', -1) do
      delete :destroy, id: @lugar
    end

    assert_redirected_to lugares_path
  end
end
