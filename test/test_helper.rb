ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'capybara/rails'
require 'webmock/test_unit'
require 'vcr'
require "mocha/mini_test"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
    config.allow_http_connections_when_no_cassette = true
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({uid: "12345",
                                                                        info: {
                                                                          name: "Parker Phillips",
                                                                          first_name: "Parker",
                                                                          last_name: "Phillips"},
                                                                        credentials: {
                                                                          token: "123456789",
                                                                          refresh_token: "987654321"}})
  end
end
