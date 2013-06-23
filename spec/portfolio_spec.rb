require 'portfolio.rb'

describe Portfolio, "#add_stock" do
  it "should return value of portfolio calling 3 google stocks" do
    a_portfolio = Portfolio.new
    a_portfolio.add_stock('GOOG', 1)
    a_portfolio.add_stock('GOOG', 6)
    a_portfolio.add_stock('GOOG', 1)
    value = a_portfolio.stocks[:GOOG].shares
    value.should == 8
  end
end

describe Portfolio, "#remove_stock" do
    it "should return fals if you try to remove too many stocks" do
        a_portfolio = Portfolio.new
        a_portfolio.add_stock('GOOG', 1)
        a_portfolio.add_stock('GOOG', 6)
        a_portfolio.add_stock('GOOG', 1)
        value = a_portfolio.remove_stock('GOOG', 9)
        value.should == false
    end
end

