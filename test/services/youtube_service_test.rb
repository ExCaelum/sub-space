require 'test_helper'

class YoutubeServiceTest < ActiveSupport::TestCase

  test '#subscriptions' do
    VCR.use_cassette('youtube_service#subscriptions') do
      service = YoutubeService.new(users(:one).token)
      response = service.subscriptions
      subscriptions = response["items"]
      subscription  = subscriptions.first

      assert_equal 1, subscriptions.count
      assert_equal 'CTNtechnologynews',  subscription["snippet"]["title"]
      assert_equal 'UCFmHIftfI9HRaDP_5ezojyw', subscription["snippet"]["resourceId"]["channelId"]
      assert_equal 'https://yt3.ggpht.com/-guT90qZVtdo/AAAAAAAAAAI/AAAAAAAAAAA/a6PuyvcrDQ4/s88-c-k-no-rj-c0xffffff/photo.jpg', subscription["snippet"]["thumbnails"]["default"]["url"]
    end
  end

  test '#more_subscriptions' do
    VCR.use_cassette('youtube_service#more_subscriptions') do
      user = users(:two)
      subscriptions = Subscription.get_subscriptions(user)
      subscription = Subscription.all[1]

      assert_equal 97, subscriptions.count
      assert_equal "UKOGmonkey", subscription.title
      assert_equal "UC0gElXJLp_puscXA7vW11sg", subscription.channel_id
      assert_equal "https://yt3.ggpht.com/-pcPnpor424U/AAAAAAAAAAI/AAAAAAAAAAA/ogrYYLZh8N4/s88-c-k-no-rj-c0xffffff/photo.jpg", subscription.thumbnail
    end
  end

end
