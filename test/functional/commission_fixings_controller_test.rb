require 'test_helper'

class CommissionFixingsControllerTest < ActionController::TestCase
  setup do
    @commission_fixing = commission_fixings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commission_fixings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commission_fixing" do
    assert_difference('CommissionFixing.count') do
      post :create, commission_fixing: @commission_fixing.attributes
    end

    assert_redirected_to commission_fixing_path(assigns(:commission_fixing))
  end

  test "should show commission_fixing" do
    get :show, id: @commission_fixing.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @commission_fixing.to_param
    assert_response :success
  end

  test "should update commission_fixing" do
    put :update, id: @commission_fixing.to_param, commission_fixing: @commission_fixing.attributes
    assert_redirected_to commission_fixing_path(assigns(:commission_fixing))
  end

  test "should destroy commission_fixing" do
    assert_difference('CommissionFixing.count', -1) do
      delete :destroy, id: @commission_fixing.to_param
    end

    assert_redirected_to commission_fixings_path
  end
end
