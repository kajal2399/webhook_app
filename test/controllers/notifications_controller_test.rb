require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get notifications_create_url
    assert_response :success
  end

  test "should get update" do
    get notifications_update_url
    assert_response :success
  end
end
