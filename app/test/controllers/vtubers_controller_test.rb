require 'test_helper'

class VtubersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vtubers_index_url
    assert_response :success
  end

end
