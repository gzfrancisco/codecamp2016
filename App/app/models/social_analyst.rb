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
