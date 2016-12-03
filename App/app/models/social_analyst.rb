class SocialAnalyst

  def common_followers(first_acount,second_acount)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "8f1rDOpFqPugqswZHTHQDYxup"
      config.consumer_secret     = "tBIEgr8UJuO1KZS4VAoBJfTaIjk3Mn9QoaSQLiO44CEzJ0SrsI"
      config.access_token        = "1415674062-9zolNmbi1PHn9343iPHQcYXXI0u7oWCanNHkqqA"
      config.access_token_secret = "T38LouEVnPdZKqfaqUvei1qMIt978Ilfw2azQ1HB7629E"
    end
    followers_f = client.followers(first_acount)
    followers_s = client.followers(second_acount)
    followers_f.map { |e| e.screen_name } & followers_s.map { |e| e.screen_name }
  end

  def friends(acount)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "8f1rDOpFqPugqswZHTHQDYxup"
      config.consumer_secret     = "tBIEgr8UJuO1KZS4VAoBJfTaIjk3Mn9QoaSQLiO44CEzJ0SrsI"
      config.access_token        = "1415674062-9zolNmbi1PHn9343iPHQcYXXI0u7oWCanNHkqqA"
      config.access_token_secret = "T38LouEVnPdZKqfaqUvei1qMIt978Ilfw2azQ1HB7629E"
    end
    followers = client.followers(acount)
    friends = client.friends(acount)

    followers.map { |e| e.screen_name } & friends.map { |e| e.screen_name }
  end


end
