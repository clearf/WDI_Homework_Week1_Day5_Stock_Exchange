require 'yahoofinance'
require '../lib/stock.rb'
require '../lib/portfolio.rb'
require '../lib/client.rb'

describe Client do

  it "has a name and balance" do
  end

  it "can add a portfolio" do
  end

  it "can delete a portfolio" do
  end

  it "cannot buy more stock than it can afford" do
  end

  it "deletes a stock from its portfolio when it is sold" do
  end

  it "adds cash to balance when a stock is sold" do
  end

end

describe Portfolio do

  it "deletes a stock when the stock is sold" do
  end

  it "adds a stock when the stock is bought" do
  end

  it "calculates its own value" do
  # the Portfolio iterates through its set of stocks
  # and adds each stock's current price

  end

end

describe Stock do

  it "initializes with a name and current price" do
    stock = Stock.new('AAPL')
    stock.name.should == 'AAPL'
    stock.price.is_a?(Float).should == true
    stock.price.should > 0
  end

  it "retrieves its current price from Yahoo Finance" do
    stock = Stock.new('AAPL')
    stock.price.is_a?(Float).should == true
    stock.price.should > 0
  end

end