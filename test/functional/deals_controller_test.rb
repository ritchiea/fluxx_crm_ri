require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  setup do
    @user1 = User.make
    sign_in @user1
    @deal = Deal.make
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, :deal => @deal.attributes
    end
    assert 201, @response.status
    assert @response.header["Location"] =~ /#{deal_path(assigns(:deal))}$/
  end

  test "should show deal" do
    get :show, :id => @deal.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deal.to_param
    assert_response :success
  end

  test "should update deal" do
    put :update, :id => @deal.to_param, :deal => @deal.attributes
    assert_redirected_to deal_path(assigns(:deal))
  end

  test "should destroy deal" do
    delete :destroy, :id => @deal.to_param

    assert_not_nil @deal.reload().deleted_at 
  end
end
