require "test_helper"

class About::AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get about_author_show_url
    assert_response :success
  end
end
