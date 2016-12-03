class FriendshipsController < ApplicationController
  def index
    analyst = SocialAnalyst.new
    # network_dictionary = analyst.friends_network("music1", "music2")
    network_dictionary = {"A": [8, 9],
                          "B": [9, 11]}
    path = analyst.graph(network_dictionary)
    p path
  end
end
