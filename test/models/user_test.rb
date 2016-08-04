require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:refresh_token)
  should validate_presence_of(:name)
  should validate_presence_of(:uid)
  should validate_presence_of(:token)
  should have_many(:subscriptions)
  should have_many(:categories)
end
