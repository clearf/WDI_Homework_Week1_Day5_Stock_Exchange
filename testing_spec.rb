require_relative 'stock'
require_relative 'client'
require_relative 'bank'

describe Stock, "#get_price" do
  it "returns a float" do
    stock = Stock.new("AAPL", 1)
    stock.get_price.kind_of? Float
  end
end

describe Client, "#sell_stock" do
  it "decrements the num_shares" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 50000000)
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    jeff_jones.buy_stock("AAPL", 100, "High Risk")
    jeff_jones.sell_stock("AAPL", 100, "High Risk")
    jeff_jones.portfolios["High Risk"].stocks["AAPL"].num_shares.should eq(0)
  end
end

describe Client, "#sell_stock" do
  it "increments the cash balance" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 50000000)
    start_balance = jeff_jones.balance
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    jeff_jones.buy_stock("AAPL", 100, "High Risk")
    jeff_jones.sell_stock("AAPL", 100, "High Risk")
    end_balance = jeff_jones.balance
    start_balance.should eq(end_balance)
  end
end

describe Client, "#buy_stock" do
  it "decrements the cash balance" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
    start_balance = jeff_jones.balance
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    jeff_jones.buy_stock("AAPL", 100, "High Risk")
    cost = jeff_jones.get_price("AAPL") * 100
    end_balance = jeff_jones.balance
    end_balance.should eq(start_balance - cost)
  end
end

describe Client, "#buy_stock" do
  it "increments the num_shares" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    jeff_jones.buy_stock("AAPL", 100, "High Risk")
    jeff_jones.portfolios["High Risk"].stocks["AAPL"].num_shares.should eq(100)
  end
end

describe Client, "#new_portfolio" do
  it "adds a new portfolio to the list when one is created" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    new_port = jeff_jones.portfolios["High Risk"]
    new_port.name.should eq("High Risk")
  end
end

describe Bank, "#new_client" do
  it "adds a new client to the list when one is created" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
    check_client = ez_bank.clients["Jeff Jones"]
    check_client.name.should eq("Jeff Jones")
  end
end

=begin
    describe Bank, "#new_client" do
      it "adds a new client to the bank" do
      ez_bank = Bank.new
      ez_bank.new_client("Jeff Jones", 50)
      ez_bank.clients.count.should eq(1)
    end
  end
=end

describe Bank, "#list_clients" do
  it "" do
    ez_bank = Bank.new
    jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
    jeff_high_risk = jeff_jones.new_portfolio("High Risk")
    new_port = jeff_jones.portfolios["High Risk"]
    new_port.name.should eq("High Risk")
  end

  describe Portfolio, "#get_portfolio_value" do
      it "calculates the value of the portfolio" do
      ez_bank = Bank.new
      jeff_jones = ez_bank.new_client("Jeff Jones", 5000000000)
      jeff_high_risk = jeff_jones.new_portfolio("High Risk")
      jeff_jones.buy_stock("AAPL", 100, "High Risk")
      jeff_high_risk.get_portfolio_value.should eq(41350)
    end
  end
end

