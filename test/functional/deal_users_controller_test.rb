require 'test_helper'

class DealUsersControllerTest < ActionController::TestCase
  setup do
    @deal_user = deal_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_user" do
    assert_difference('DealUser.count') do
      post :create, :deal_user => @deal_user.attributes
    end

    assert_redirected_to deal_user_path(assigns(:deal_user))
  end

  test "should show deal_user" do
    get :show, :id => @deal_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deal_user.to_param
    assert_response :success
  end

  test "should update deal_user" do
    put :update, :id => @deal_user.to_param, :deal_user => @deal_user.attributes
    assert_redirected_to deal_user_path(assigns(:deal_user))
  end

  test "should destroy deal_user" do
    assert_difference('DealUser.count', -1) do
      delete :destroy, :id => @deal_user.to_param
    end

    assert_redirected_to deal_users_path
  end
end
