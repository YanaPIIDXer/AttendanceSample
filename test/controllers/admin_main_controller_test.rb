require 'test_helper'

class AdminMainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_main_index_url
    assert_response :success
  end

end
