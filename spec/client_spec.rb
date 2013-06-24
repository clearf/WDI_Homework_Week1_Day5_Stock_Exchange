require 'client'

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
#   it "should not let client buy stock without sufficient balance" do
#     client = Client.new("Kevin", 100_000)
#     client.create_portfolio("CleanTech")
#     client.buy_stock("GOOG", 30000, "CleanTech")
#   end
# end