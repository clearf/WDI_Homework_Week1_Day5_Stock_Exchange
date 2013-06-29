require 'stock_exchange_lab'

describe Client, ".name" do
  # it "creates an instance of the client class" do
  #   c1 = Client.new
  #   c1.class.should == Client
  # end
  it "Has a name" do
    c1 = Client.new("Phil")
    c1.name.should == "Phil"
  end
  it "Has an opening balance of $1" do
    c1 = Client.new("Tom")
    c1.balance.should == 1
  end
  it "Has a portfolio" do
    c1 = Client.new("Alice")
    c1.portfolio.should == []
  end
end

#client = Client.new # class #method
#client.name # instance .method