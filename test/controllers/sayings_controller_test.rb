require 'test_helper'

class SayingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sayings_index_url
    assert_response :success
  end

  test "should get new" do
    get sayings_new_url
    assert_response :success
  end

  test "should get show" do
    get sayings_show_url
    assert_response :success
  end

end
