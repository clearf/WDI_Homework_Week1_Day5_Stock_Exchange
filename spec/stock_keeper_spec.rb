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
      p.name.should == "Technology"
      p.stocks.should == {}
    end

    it "can add a portfolio with stocks" do
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

    it "adds cash to balance when stock is sold" do
    end

  end

end

describe Portfolio do

  describe "#new" do

    it "has a name, a hash of stocks, and a total value" do
    p.name.should == ("Technology")
    p.stocks.class.should == Hash
    p.value.is_a?(Float).should == true

  end

  describe "#sell_stocks" do

    it "deletes a stock from its portfolio when all shares are sold" do
    end

    it "deducts shares from stock if stock is only partially sold" do
    end

    it "returns false if the client doesn't have enough shares to sell" do
    end

    it "returns false if the client doesn't own that stock at all"

  end

  describe "#buy_stocks" do

    it "adds the correct number of shares if client already owns stock" do
    end

    it "adds the stock with correct number of shares if the stock is new"

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