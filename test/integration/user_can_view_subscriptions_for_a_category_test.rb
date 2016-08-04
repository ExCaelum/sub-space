require "test_helper"

class UserLogsInWithGoogleTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SubSpace::Application
    stub_omniauth
  end

  test "User can view subscriptions when visiting a category show page" do
    VCR.use_cassette('youtube_service#more_subscriptions') do
      visit "/"
      assert_equal 200, page.status_code

      click_link "Sign in with Google"
      click_link "Logout"
      click_link "Sign in with Google"
      assert_equal "/dashboard", current_path
      assert page.has_content?("Welcome")
      assert page.has_link?("Setup Categories")
    end
  end
end
