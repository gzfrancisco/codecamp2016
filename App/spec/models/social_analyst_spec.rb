require 'rails_helper'

RSpec.describe SocialAnalyst, :vcr do

  before do
    @analyst = SocialAnalyst.new()
  end

  it "Give me the followers in common of two acounts" do
    commons = @analyst.common_followers("music2","music4")
    expect(commons).to eq(["cggg88jorge"])
  end

  it "Give me the list of friends a acount" do
    commons = @analyst.friends("music2")
    expect(commons).to eq(["ll0l00dev"])
  end

  it "Give me the list of friends a acount filtered by list of followers in common" do
    commons = @analyst.friends("music2")
    expect(commons).to eq(["ll0l00dev"])
  end 

end
