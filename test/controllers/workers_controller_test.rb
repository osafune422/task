require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage_worker" do
    get workers_mypage_worker_url
    assert_response :success
  end

end
