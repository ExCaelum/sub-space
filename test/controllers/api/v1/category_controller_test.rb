require 'test_helper'

class Api::V1::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "Create categories" do
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
    post "/api/v1/categories?name=music"

    assert_response :success

    category = JSON.parse(response.body)

    assert_equal 2, Category.count
    assert_equal "music", category["name"]
  end

end
