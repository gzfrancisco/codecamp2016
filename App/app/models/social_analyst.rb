class SocialAnalyst

  def common_followers(firstAcount,secondAcount)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Kf3duHTzPl3UTNZ9eW438fmtD"
      config.consumer_secret     = "2PZdAdiB42s3tT3eaht9Db7CX0mBo1HU1iXeMqALKqEDuFAOLb"
      config.access_token        = "1415674062-Tl1yzoynINYezB7KKYaGV10hdOch3EDnFqzI1rS"
      config.access_token_secret = "cXDzlTnV8C4q5VReYMQntn8S3YfExmR7KgOedw9ZHdluW"
    end
    client.follow("gzfrancisco")
    followers_cg = [{screen_name:"1",following:false},
                    {screen_name:"2",following:true},
                    {screen_name:"3",following:false},
                    {screen_name:"8",following:true},
                    {screen_name:"9",following:true}]

    followers_gz = [{screen_name:"4",following:false},
                    {screen_name:"5",following:true},
                    {screen_name:"6",following:false},
                    {screen_name:"8",following:false},
                    {screen_name:"9",following:true}]
    followers_gz.map { |e| e[:screen_name] } & followers_cg.map { |e| e[:screen_name] }
  end

  def friends(acount)
    followers = [{screen_name:"1",following:false},
                {screen_name:"2",following:true},
                {screen_name:"3",following:false},
                {screen_name:"8",following:true},
                {screen_name:"9",following:true}]
    followers.select { |e| e[:following] }.map { |e| e[:screen_name] }
  end


end
