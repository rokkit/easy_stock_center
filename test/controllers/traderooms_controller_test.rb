require 'test_helper'

class TraderoomsControllerTest < ActionController::TestCase
  setup do
    @traderoom = traderooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:traderooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create traderoom" do
    assert_difference('Traderoom.count') do
      post :create, traderoom: { name: @traderoom.name }
    end

    assert_redirected_to traderoom_path(assigns(:traderoom))
  end

  test "should show traderoom" do
    get :show, id: @traderoom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @traderoom
    assert_response :success
  end

  test "should update traderoom" do
    patch :update, id: @traderoom, traderoom: { name: @traderoom.name }
    assert_redirected_to traderoom_path(assigns(:traderoom))
  end

  test "should destroy traderoom" do
    assert_difference('Traderoom.count', -1) do
      delete :destroy, id: @traderoom
    end

    assert_redirected_to traderooms_path
  end
end
