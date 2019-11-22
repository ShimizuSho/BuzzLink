require 'test_helper'

class DegreesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get degrees_new_url
    assert_response :success
  end

  test "should get create" do
    get degrees_create_url
    assert_response :success
  end

  test "should get edit" do
    get degrees_edit_url
    assert_response :success
  end

end
