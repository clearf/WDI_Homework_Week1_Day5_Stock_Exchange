require 'finance'

describe Stock, "#get_share_price" do
  aapl_share_price == YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

end





