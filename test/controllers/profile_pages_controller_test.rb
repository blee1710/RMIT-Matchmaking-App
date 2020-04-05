require 'test_helper'

class ProfilePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get profile_pages_main_url
    assert_response :success
  end

end
