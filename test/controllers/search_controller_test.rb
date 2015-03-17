require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get all" do
    get :all
    assert_response :success
  end

  test "should get posts" do
    get :posts
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get requests" do
    get :requests
    assert_response :success
  end

end
