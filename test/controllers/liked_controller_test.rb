require 'test_helper'

class LikedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get liked_index_url
    assert_response :success
  end

end
