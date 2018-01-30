require 'test_helper'

class WorkersControllerTest < ActionDispatch::IntegrationTest
  test "should get new_worker" do
    get workers_new_worker_url
    assert_response :success
  end

end
