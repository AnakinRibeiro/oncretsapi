require 'test_helper'

class ActivitiesTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activities_type = activities_types(:one)
  end

  test "should get index" do
    get activities_types_url
    assert_response :success
  end

  test "should get new" do
    get new_activities_type_url
    assert_response :success
  end

  test "should create activities_type" do
    assert_difference('ActivitiesType.count') do
      post activities_types_url, params: { activities_type: { name: @activities_type.name } }
    end

    assert_redirected_to activities_type_url(ActivitiesType.last)
  end

  test "should show activities_type" do
    get activities_type_url(@activities_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_activities_type_url(@activities_type)
    assert_response :success
  end

  test "should update activities_type" do
    patch activities_type_url(@activities_type), params: { activities_type: { name: @activities_type.name } }
    assert_redirected_to activities_type_url(@activities_type)
  end

  test "should destroy activities_type" do
    assert_difference('ActivitiesType.count', -1) do
      delete activities_type_url(@activities_type)
    end

    assert_redirected_to activities_types_url
  end
end
