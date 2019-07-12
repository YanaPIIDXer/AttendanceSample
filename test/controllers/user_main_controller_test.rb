require 'test_helper'

class UserMainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_main_index_url
    assert_response :success
  end

end
