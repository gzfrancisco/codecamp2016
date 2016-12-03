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

  def graph(dic)
    %{
graph G {
    node [shape = doublecircle];
    node [shape = circle];
    <%= u1 %> [color=blue] <%= u2 %> [color=blue];
    <% for r1.each do |e| -%>
    <%= u1 %> -- <%= e %>;
    <% end %>
    <% for r2.each do |e| -%>
    <%= u2 %> -- <%= e %>;
    <% end %>
}
    }
    dic.each_pair do |key, value|
      u << key
      r << value
    end
    u1 = u[0]
    u2 = u[1]
    r1 = r[0]
    r2 = r[1]
    result = ERB.new(template).result
    `dot -Tpng #{result} -o file.png`
  end
end
