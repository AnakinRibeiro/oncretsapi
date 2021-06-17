require 'test_helper'

class ConstructionsActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constructions_activity = constructions_activities(:one)
  end

  test "should get index" do
    get constructions_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_constructions_activity_url
    assert_response :success
  end

  test "should create constructions_activity" do
    assert_difference('ConstructionsActivity.count') do
      post constructions_activities_url, params: { constructions_activity: { activities_type_id: @constructions_activity.activities_type_id, construction_id: @constructions_activity.construction_id, user_id: @constructions_activity.user_id } }
    end

    assert_redirected_to constructions_activity_url(ConstructionsActivity.last)
  end

  test "should show constructions_activity" do
    get constructions_activity_url(@constructions_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_constructions_activity_url(@constructions_activity)
    assert_response :success
  end

  test "should update constructions_activity" do
    patch constructions_activity_url(@constructions_activity), params: { constructions_activity: { activities_type_id: @constructions_activity.activities_type_id, construction_id: @constructions_activity.construction_id, user_id: @constructions_activity.user_id } }
    assert_redirected_to constructions_activity_url(@constructions_activity)
  end

  test "should destroy constructions_activity" do
    assert_difference('ConstructionsActivity.count', -1) do
      delete constructions_activity_url(@constructions_activity)
    end

    assert_redirected_to constructions_activities_url
  end
end
