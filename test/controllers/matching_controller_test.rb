require 'test_helper'

class MatchingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matching_index_url
    assert_response :success
  end

  test "should get show" do
    get matching_show_url
    assert_response :success
  end

end
