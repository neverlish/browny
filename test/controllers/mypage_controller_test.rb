require 'test_helper'

class MypageControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get mypage_user_url
    assert_response :success
  end

  test "should get my" do
    get mypage_my_url
    assert_response :success
  end

end
