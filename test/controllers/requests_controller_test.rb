require 'test_helper'

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get input_screen" do
    get requests_input_screen_url
    assert_response :success
  end

end
