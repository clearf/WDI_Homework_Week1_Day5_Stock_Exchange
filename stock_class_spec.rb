# Code by Christine Coulter and Tom Brennan

require 'pry'
require 'stocks_class'

describe Stock, ".ticker" do
  it "Has a ticker" do
    s1 = Stock.new("CSCO")
    s1.ticker.should == "CSCO"
  end
end


