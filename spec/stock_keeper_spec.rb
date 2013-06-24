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
      c = Client.new("Mr. Namely Name", 20000000)
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100),}
      p = Portfolio.new("Technology", tech_stocks)
      p.name.should == "Technology"
      p.stocks.size.should == 3
    end


  end

  describe "#delete_portfolio" do

   it "can delete a portfolio" do
      c = Client.new("Mr. Namely Name", 20000000)
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p1 = Portfolio.new("Technology", tech_stocks)
      industrials_stocks = { 'ORCL' => Stock.new('EDMC', 100),
                             'MEI' => Stock.new('TTGT', 100),
                             'GE' => Stock.new('DMRC', 100) }
      p2 = Portfolio.new("Industrials", industrials_stocks)
      c.delete_portfolio("Industrials")
      c.portfolios.size.should == 1
    end

  end

  describe "#buy_stocks" do

    it "cannot buy more stock than it can afford" do
      c = Client.new("Mr. Namely Name", 0)
      p = Portfolio.new("Technology")
      (c.buy_stocks('AAPL', 100000, "Technology")).should == false
    end

  end

  describe "#sell_stocks" do

    it "adds cash to balance when stock is sold" do
      c = Client.new("Mr. Namely Name", 0)
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      c.sell_stocks('ORCL', 100, "Technology")
      c.balance.should > 0
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
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.sell_stocks('ORCL', 100)
      p.stocks['ORCL'].should == nil
    end

    it "deducts shares from stock if stock is only partially sold" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.sell_stocks('ORCL', 50)
      p.stocks['ORCL'].num_of_shares.should == 50
    end

    it "returns false if the client doesn't have enough shares to sell" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      (p.sell_stocks('ORCL', 150)).should == false
    end

    it "returns false if the client doesn't own that stock at all" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      (p.sell_stocks('DMRC', 150)).should == false
    end

  end

  describe "#buy_stocks" do

    it "adds the correct number of shares if client already owns stock" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.buy_stocks('ORCL', 100)
      p.stocks['ORCL'].num_of_shares.should == 200
    end

    it "adds the stock with correct number of shares if the stock is new" do
      tech_stocks = { 'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.buy_stocks('ORCL', 100)
      p.stocks['ORCL'].num_of_shares.should == 100
    end

  end

  describe "#calculate_value"

    it "calculates its own value" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.calculate_value.should > 0
    end

    it "returns 0 when there are no stocks" do
      tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                      'TTGT' => Stock.new('TTGT', 100),
                      'DMRC' => Stock.new('DMRC', 100) }
      p = Portfolio.new("Technology", tech_stocks)
      p.calculate_value.should == 0
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