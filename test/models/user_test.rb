require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:uid)
  should validate_presence_of(:token)
  should validate_presence_of(:refresh_token)
end
