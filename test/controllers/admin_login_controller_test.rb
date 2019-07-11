require 'test_helper'

class AdminLoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_login_index_url
    assert_response :success
  end

end
