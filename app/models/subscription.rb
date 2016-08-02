class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  attr_reader :service


  def self.service(token)
    @service ||= YoutubeService.new(token)
  end

  def self.get_subscriptions(current_user)
    api_all(current_user)
    Subscription.all
  end

  def self.api_all(current_user)
    response = service(current_user.token).subscriptions
    subscriptions = response["items"]
    subscriptions.each do |subscription|
      Subscription.create(sub_hash(subscription, current_user))
    end
    while response["nextPageToken"]
      response = service(current_user.token).more_subscriptions(response["nextPageToken"])
      subscriptions = response["items"]
      subscriptions.each do |subscription|
        Subscription.create(sub_hash(subscription, current_user))
      end
    end
  end

  def self.sub_hash(subscription, current_user)
    {
      user: current_user,
      category: nil,
      title: subscription["snippet"]["title"],
      channel_id: subscription["snippet"]["resourceId"]["channelId"],
      thumbnail: subscription["snippet"]["thumbnails"]["default"]["url"]
    }
  end
end
