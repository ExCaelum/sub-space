class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true

  attr_reader :service


  def self.service(token)
    @service ||= YoutubeService.new(token)
  end

  def self.get_subscriptions(current_user)
    if (current_user.subscriptions.all.count == 0)
      api_all(current_user)
    end
    Subscription.where(category_id: nil)
  end

  private

  def self.api_all(current_user)
    response = service(current_user.token).subscriptions
    create_subs(response["items"], current_user)
    while response["nextPageToken"]
      response = service(current_user.token).more_subscriptions(response["nextPageToken"])
      create_subs(response["items"], current_user)
    end
  end

  def self.create_subs(subscriptions, current_user)
    subscriptions.each do |subscription|
      Subscription.create(sub_hash(subscription, current_user))
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
