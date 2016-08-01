require 'test_helper'

class YoutubeServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = YoutubeService.new
  end

  test '#subscriptions' do
  VCR.use_cassette('youtube_service#subscriptions') do
    subscriptions = service.subscriptions(conditions)
    subscription  = subscriptions.first

    assert_equal 20,      subscriptions.count
    assert_equal 'Joni',  subscription[:first_name]
    assert_equal 'Ernst', subscription[:last_name]
  end
end

end
