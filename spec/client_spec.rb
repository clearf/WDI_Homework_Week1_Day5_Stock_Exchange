require 'client'
require 'stock'
require_relative 'spec_helper'

describe Client, "#new_client" do
  it "should have a balance to start with" do
    client = Client.new("Kevin", 100_000)
    client.balance.should == 100_000
  end

  it "should have a name to start with" do
    client = Client.new("Kevin", 100_000)
    client.name.should == "Kevin"
  end
end

describe Client, "#new_portfolio" do
  it "should set up new portfolio in a hash" do
    client = Client.new("Kevin", 100_000)
    client.create_portfolio("CleanTech")
    client.portfolio.class == "Hash"
  end
end

# describe Client, "#buy_stock" do
#   before(:each) do
#     @client = Client.new("Kevin", 100_000)
#     @portfolio = @client.create_portfolio("CleanTech")
#   end
#   it "should return an error if the ticker in invalid" do

#     @client.buy_stock("000000", 1, "CleanTech").should_raise("InvalidTicker")
#   end
# end

# describe Client, "#buy_stock" do
#   it "should not let client buy stock without sufficient balance" do
#     client = Client.new("Kevin", 100_000)
#     client.create_portfolio("CleanTech")
#     client.buy_stock("GOOG", 30000, "CleanTech").should raise_error(StandardError)
#     #== "BUY FAIL"
#     # raise
#   end
# end