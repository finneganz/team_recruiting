require 'test_helper'

class ScoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scouts_new_url
    assert_response :success
  end

  test "should get index" do
    get scouts_index_url
    assert_response :success
  end

  test "should get show" do
    get scouts_show_url
    assert_response :success
  end

end
