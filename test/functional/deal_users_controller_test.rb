require 'test_helper'

class DealUsersControllerTest < ActionController::TestCase
  setup do
    @user1 = User.make
    sign_in @user1
    @user = User.make
    @deal = Deal.make
    @deal_user = DealUser.make :user => @user, :deal => @deal
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

    assert 201, @response.status
    assert @response.header["Location"] =~ /#{deal_user_path(assigns(:deal_user))}$/
  end

  test "should show deal_user" do
    get :show, :id => @deal_user.to_param
    assert_response :success
  end

  test "should destroy deal_user" do
    assert_difference('DealUser.count', -1) do
      delete :destroy, :id => @deal_user.to_param
    end
  end
end
