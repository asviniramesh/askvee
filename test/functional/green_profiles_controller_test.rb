require 'test_helper'

class GreenProfilesControllerTest < ActionController::TestCase
  setup do
    @green_profile = green_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:green_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create green_profile" do
    assert_difference('GreenProfile.count') do
      post :create, green_profile: @green_profile.attributes
    end

    assert_redirected_to green_profile_path(assigns(:green_profile))
  end

  test "should show green_profile" do
    get :show, id: @green_profile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @green_profile.to_param
    assert_response :success
  end

  test "should update green_profile" do
    put :update, id: @green_profile.to_param, green_profile: @green_profile.attributes
    assert_redirected_to green_profile_path(assigns(:green_profile))
  end

  test "should destroy green_profile" do
    assert_difference('GreenProfile.count', -1) do
      delete :destroy, id: @green_profile.to_param
    end

    assert_redirected_to green_profiles_path
  end
end
