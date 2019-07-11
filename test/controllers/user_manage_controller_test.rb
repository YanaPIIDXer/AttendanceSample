require 'test_helper'

class UserManageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_manage_index_url
    assert_response :success
  end

end
