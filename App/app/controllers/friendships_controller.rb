class FriendshipsController < ApplicationController

  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Kf3duHTzPl3UTNZ9eW438fmtD"
      config.consumer_secret     = "2PZdAdiB42s3tT3eaht9Db7CX0mBo1HU1iXeMqALKqEDuFAOLb"
      config.access_token        = "1415674062-Tl1yzoynINYezB7KKYaGV10hdOch3EDnFqzI1rS"
      config.access_token_secret = "cXDzlTnV8C4q5VReYMQntn8S3YfExmR7KgOedw9ZHdluW"
    end
    # followers_cg = client.followers("cggg88jorge").map { |e| e.screen_name }
    # followers_gz = client.followers("gzfrancisco").map { |e| e.screen_name }
    followers_cg = %w[one two tree]
    followers_gz = %w[one tree four]
    p followers_gz & followers_cg
    
    p [{name: "one", following: true}, {name: "two", following: false}].select { |e| e[:following] }
  end

end
