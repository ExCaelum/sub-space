require "test_helper"

class UserLogsInWithGoogleTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SubSpace::Application
    stub_omniauth
  end

  test "User can login, create categories, and assign subscriptions" do
    VCR.use_cassette('youtube_service#more_subscriptions') do
      visit "/"
      assert_equal 200, page.status_code

      click_link "Sign in with Google"
      assert_equal "/setup", current_path
      fill_in "category-name", with: "Music"
      click_on "create-category"
      assert page.has_content?("Music")
    end
  end
end
