require 'test_helper'

class DealOrganizationsControllerTest < ActionController::TestCase
  setup do
    @user1 = User.make
    sign_in @user1
    @deal_organization = deal_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deal_organizations)
  end

  test "should create deal_organization" do
    assert_difference('DealOrganization.count') do
      post :create, :deal_organization => @deal_organization.attributes
    end

    assert 201, @response.status
    assert @response.header["Location"] =~ /#{deal_organization_path(assigns(:deal_organization))}$/
  end

  test "should show deal_organization" do
    get :show, :id => @deal_organization.to_param
    assert_response :success
  end

  test "should destroy deal_organization" do
    assert_difference('DealOrganization.count', -1) do
      delete :destroy, :id => @deal_organization.to_param
    end
  end
end
