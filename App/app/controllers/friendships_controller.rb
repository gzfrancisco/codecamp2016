class FriendshipsController < ApplicationController
  def index
    analyst = SocialAnalyst.new
    network_dictionary = analyst.friends_network("music1", "music2")
    path = analyst.graph(network_dictionary)
    p path
  end
end
