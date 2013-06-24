require 'finance'
require 'YahooFinance'

describe Stock, "#get_share_price" do
  it "should return Apple's share price" do
    apple = Stock.new('AAPL')
    apple_test_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade
    apple_test_price.should == (apple.share_price)
  end

  it "should return Microsoft's share price" do
    microsoft = Stock.new('MSFT')
    microsoft_test_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, 'MSFT')['MSFT'].lastTrade
    microsoft_test_price.should == (microsoft.share_price)
  end

  it "should return a price of zero for a non-existent stock" do
    blank = Stock.new('WRONG')
    blank_test_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, 'WRONG')['WRONG'].lastTrade
    blank_test_price.should == (0)
  end

  # it "should return an error message for a null-value stock name" do
  #   blank = Stock.new('')
  #   blank_test_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, '')[''].lastTrade
  #   rescue NoMethodError
  #     true
  #   end
  # end
end

describe Stock, "#buy_stock" do

end

# describe Portfolio, "#get_portfolio" do
  # it "should return the portfolio" do
  # end
# end

# describe Client, "#get_account_info" do
# end


