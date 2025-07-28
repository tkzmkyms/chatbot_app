# test/controllers/messages_controller_test.rb

require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should create message" do
    post messages_url, params: { message: { content: "こんにちは" } }
    assert_redirected_to root_url
  end
end
