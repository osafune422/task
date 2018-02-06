require 'test_helper'

class LovegraphControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get lovegraph_top_url
    assert_response :success
  end

end
