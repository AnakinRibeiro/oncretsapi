require 'test_helper'

class PasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get reset_password_user" do
    get password_reset_password_user_url
    assert_response :success
  end

end
