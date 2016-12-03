require 'rails_helper'

RSpec.describe SocialAnalyst, :vcr do

  before do
    @analyst = SocialAnalyst.new()
  end

  it "Give me the followers in common of two acounts" do
    commons = @analyst.common_followers("cggg88jorge","gzfrancisco")
    expect(commons).to eq(["8","9"])
  end

  it "Give me the list of friends a acount" do
    commons = @analyst.friends("cggg88jorge")
    expect(commons).to eq(["2","8","9"])
  end

end
