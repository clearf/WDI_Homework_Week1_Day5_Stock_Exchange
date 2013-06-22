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
end

describe





