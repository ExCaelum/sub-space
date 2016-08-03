require 'test_helper'

class Api::V1::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  test "can update the subscription's category id" do

    patch "/api/v1/subscriptions/1?category_id=#{categories(:one).id}"

    assert_response :success
    sub_hash = JSON.parse(response.body)
    subscription = Subscription.find(sub_hash["id"])

    assert_equal 1, subscription.category.id
    assert_equal "Music", subscription.category.name
  end


end
