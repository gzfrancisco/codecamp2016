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

  def filter_friends(friends,common)
    friends & common
  end

  def get_friends_map(first_acount,second_acount)
    common = common_followers(first_acount,second_acount)
    friends_f = friends(first_acount)
    friends_s = friends(second_acount)

    friends_s = filter_friends(friends_s,common)
    friends_f = filter_friends(friends_f,common)

    {"#{first_acount}": friends_f,"#{second_acount}": friends_f}
  end

  def graph(dic)
    u = []
    r = []
    dic.each_pair do |key, value|
      u << key
      r << value
    end
    u1 = u[0]
    u2 = u[1]
    r1 = r[0]
    r2 = r[1]

    template = "graph G {
    node [shape = doublecircle];
    node [shape = circle];
    #{u1} [color=blue] #{u2} [color=blue];"
    r1.each do |e|
      template  << "#{u1} -- #{e};"
    end
    r2.each do |e|
      template  << "#{u2} -- #{e};"
    end
    template << "}"
    result = ERB.new(template).result
    p result
    File.open('graph.dot', "w+") do |f|
      f.write(result)
    end
    `dot -Tpng graph.dot -o file.png`
  end

  def json_nodes(dic)
    u = []
    r = []
    nodes = []
    dic.each_pair do |key, value|
      nodes << {name: key, group: 1}
      value.each do |e|
        nodes << {name: e, group: 2}
      end
    end
    # u.each do |usr|

    # end
    # r.each do |rel|
    #   rel.each do |e|
    #   end
    # end
    elements = []
    links = []
    dic.each_pair do |key, value|
      elements << key
      value.each do |e|
        elements << e
        p "#{key}, #{e}"
        links << {source: elements.find_index(key), target: elements.find_index(e), weight: 1}
      end
    end



    { nodes: nodes,
      links: links
    }
  end
end
