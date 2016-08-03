require "test_helper"

class UserLogsInWithGoogleTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  def setup
    Capybara.app = SubSpace::Application
    stub_omniauth
  end

  test "logging in" do
    skip
    visit "/"
    assert_equal 200, page.status_code

    click_link "Sign in with Google"
    assert_equal "/", current_path
    assert page.has_content?("Parker")
    assert page.has_link?("Logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({uid: "12345",
                                                                 info: {name: "Parker Phillips",
                                                                        first_name: "Parker",
                                                                        last_name: "Phillips"},
                                                                 credentials: {token: "123456789",
                                                                               refresh_token: "987654321"}})
  end
end
