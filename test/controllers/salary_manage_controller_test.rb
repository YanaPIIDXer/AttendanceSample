require 'test_helper'

class SalaryManageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get salary_manage_index_url
    assert_response :success
  end

end
