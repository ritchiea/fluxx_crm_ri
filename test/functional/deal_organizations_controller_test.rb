require 'test_helper'

class DealOrganizationsControllerTest < ActionController::TestCase
  setup do
    @user1 = User.make
    login_as @user1
    @deal_organization = deal_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deal_organization" do
    assert_difference('DealOrganization.count') do
      post :create, :deal_organization => @deal_organization.attributes
    end

    assert_redirected_to deal_organization_path(assigns(:deal_organization))
  end

  test "should show deal_organization" do
    get :show, :id => @deal_organization.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @deal_organization.to_param
    assert_response :success
  end

  test "should update deal_organization" do
    put :update, :id => @deal_organization.to_param, :deal_organization => @deal_organization.attributes
    assert_redirected_to deal_organization_path(assigns(:deal_organization))
  end

  test "should destroy deal_organization" do
    assert_difference('DealOrganization.count', -1) do
      delete :destroy, :id => @deal_organization.to_param
    end

    assert_redirected_to deal_organizations_path
  end
end
