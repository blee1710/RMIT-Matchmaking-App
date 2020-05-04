require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test "layout_links" do
    get profile_page_main_path
    assert_template 'profile_pages/main'
    assert_select "a[href=?]", profile_page_main_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", destroy_user_session
  end
end
