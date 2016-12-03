require 'rails_helper'

RSpec.describe SocialAnalyst, type: :model do

  before do
    @analyst = SocialAnalyst.new()
  end
  
  it "Give me the followers in common of two acounts" do
    commons = @analyst.common_followers("cggg88jorge","gzfrancisco")
    commons.should eq(["8","9"])
  end

  it "Give me the list of friends a acount" do
    commons = @analyst.friends("cggg88jorge")
    commons.should eq(["2","8","9"])
  end

end
