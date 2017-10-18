require 'test_helper'

class FeesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fees_new_url
    assert_response :success
  end

end
