class YoutubeService
  attr_reader :connection

  def initialize(token)
    @connection = Faraday.new('https://www.googleapis.com/youtube/v3/')
    connection.headers["Authorization"] = "Bearer #{token}"
  end

  def subscriptions
    response = @connection.get("subscriptions?part=snippet&maxResults=50&mine=true")
    parse(response)
  end

  def more_subscriptions(next_page)
    response = @connection.get("subscriptions?part=snippet&maxResults=50&mine=true&pageToken=#{next_page}")
    parse(response)
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end

end
