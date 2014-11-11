require 'test_helper'

class ProxyControllerTest < ActionController::TestCase
  test "should get get_commits" do
    get :get_commits
    assert_response :success
  end

end
