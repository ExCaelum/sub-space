class YoutubeService
  attr_reader :connection

def initialize
  @connection = Faraday.new('http://Google.uri')
  # connection.params[:apikey] = ENV['GOOGLE_KEY']
end

end
