require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get tutorial" do
    get :tutorial
    assert_response :success
  end

  test "should get policy" do
    get :policy
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
