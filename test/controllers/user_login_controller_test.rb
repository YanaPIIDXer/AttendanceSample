require 'test_helper'

class UserLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_login_index_url
    assert_response :success
  end

end
