require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:category)
end
