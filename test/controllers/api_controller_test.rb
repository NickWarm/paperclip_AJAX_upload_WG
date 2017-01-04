require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get image_upload" do
    get :image_upload
    assert_response :success
  end

end
