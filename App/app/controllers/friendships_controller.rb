class FriendshipsController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Kf3duHTzPl3UTNZ9eW438fmtD"
      config.consumer_secret     = "2PZdAdiB42s3tT3eaht9Db7CX0mBo1HU1iXeMqALKqEDuFAOLb"
      config.access_token        = "1415674062-Tl1yzoynINYezB7KKYaGV10hdOch3EDnFqzI1rS"
      config.access_token_secret = "cXDzlTnV8C4q5VReYMQntn8S3YfExmR7KgOedw9ZHdluW"
    end
    p client.followers("cggg88jorge")
  end

end
