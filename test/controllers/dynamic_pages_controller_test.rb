require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dynamic_pages_show_url
    assert_response :success
  end

end
