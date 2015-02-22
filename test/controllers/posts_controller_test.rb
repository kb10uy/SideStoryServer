require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get wdit" do
    get :wdit
    assert_response :success
  end

end
