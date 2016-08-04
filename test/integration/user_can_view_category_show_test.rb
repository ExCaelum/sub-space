require 'test_helper'

class UserCanViewCategoryShowTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  test "user clicks on category name and sees his subscriptions on the show page" do
    skip
    ApplicationController.any_instance.stubs(:current_user).returns(users(:one))
    get "/dashboard#"
    assert_response :success
    assert page.has_content?("Music")
    click_link "Music"
    assert_equal "/categories/1", current_path
  end

end
