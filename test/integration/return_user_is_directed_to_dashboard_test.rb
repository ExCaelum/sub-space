require "test_helper"

class UserLogsInWithGoogleTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SubSpace::Application
    stub_omniauth
  end

  test "Retun user is directed to the dashboard" do
    VCR.use_cassette('youtube_service#more_subscriptions') do
      visit "/"
      assert_equal 200, page.status_code

      click_link "Sign in with Google"
      assert_equal "/setup", current_path
      assert page.has_content?("Welcome")
      assert page.has_link?("Complete!")
      click_link "Logout"
      click_link "Sign in with Google"
      assert_equal "/dashboard", current_path
      assert page.has_content?("Welcome")
      assert page.has_link?("Setup Categories")
    end
  end
end
