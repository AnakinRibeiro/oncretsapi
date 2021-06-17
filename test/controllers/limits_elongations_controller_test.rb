require 'test_helper'

class LimitsElongationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @limits_elongation = limits_elongations(:one)
  end

  test "should get index" do
    get limits_elongations_url
    assert_response :success
  end

  test "should get new" do
    get new_limits_elongation_url
    assert_response :success
  end

  test "should create limits_elongation" do
    assert_difference('LimitsElongation.count') do
      post limits_elongations_url, params: { limits_elongation: { final_length: @limits_elongation.final_length, inferior_limit: @limits_elongation.inferior_limit, initial_length: @limits_elongation.initial_length, upper_limit: @limits_elongation.upper_limit } }
    end

    assert_redirected_to limits_elongation_url(LimitsElongation.last)
  end

  test "should show limits_elongation" do
    get limits_elongation_url(@limits_elongation)
    assert_response :success
  end

  test "should get edit" do
    get edit_limits_elongation_url(@limits_elongation)
    assert_response :success
  end

  test "should update limits_elongation" do
    patch limits_elongation_url(@limits_elongation), params: { limits_elongation: { final_length: @limits_elongation.final_length, inferior_limit: @limits_elongation.inferior_limit, initial_length: @limits_elongation.initial_length, upper_limit: @limits_elongation.upper_limit } }
    assert_redirected_to limits_elongation_url(@limits_elongation)
  end

  test "should destroy limits_elongation" do
    assert_difference('LimitsElongation.count', -1) do
      delete limits_elongation_url(@limits_elongation)
    end

    assert_redirected_to limits_elongations_url
  end
end
