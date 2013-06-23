require 'yahoofinance'
require '../lib/stock.rb'
require '../lib/portfolio.rb'
require '../lib/client.rb'

describe Client do

  describe "#new" do

    it "has a name and balance" do
      c = Client.new("Mr. Namely Name", 452562)
      c.name.should == "Mr. Namely Name"
      c.balance.should == 452562
    end

  end

  describe "#add_portfolio" do

    it "can add a blank portfolio" do
      c = Client.new("Mr. Namely Name", 452562)
      p = Portfolio.new("Technology")
    end

  end

  describe "#delete_portfolio" do

   it "can delete a portfolio" do
      c = Client.new("Mr. Namely Name", 452562)
      p1 = Portfolio.new()
      p2 = Portfolio.new()
      c.delete_portfolio(portfolio_name) ## Must add actual name
    end

  end

  describe "#buy_stocks" do

    it "cannot buy more stock than it can afford" do
    end

  end

  describe "#sell_stocks" do

    it "deletes a stock from its portfolio when it is sold" do
    end

    it "adds cash to balance when a stock is sold" do
    end

  end

end

describe Portfolio do

  describe "#new" do

    it "has a name and a hash of stocks" do
    p.name.should == ("Technology")
    p.stocks.class.should == Hash

  end

  describe "#sell_stocks" do
    it "deletes a stock when the stock is sold" do
    end
  end

  describe "#buy_stocks" do
    it "adds a stock when the stock is bought" do
    end
  end

  describe "#calculate_value"

    it "calculates its own value" do
    # the Portfolio iterates through its set of stocks
    # and adds each stock's current price
    end

  end

end

describe Stock do

  describe "#new" do
    it "initializes with a name, number of shares, and current total price" do
      stock = Stock.new('AAPL', 50)
      stock.name.should == 'AAPL'
      stock.total_price.is_a?(Float).should == true
      stock.total_price.should > 0
    end
  end

  describe "#get_total_price" do
    it "retrieves its current price from Yahoo Finance" do
    stock = Stock.new('AAPL', 50)
    stock.total_price.is_a?(Float).should == true
    stock.total_price.should > 0
    end
  end

end