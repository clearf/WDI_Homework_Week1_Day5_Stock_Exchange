require 'yahoofinance'

class Stock

  def Stock.get_price(ticker)
    price_query = YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
  end
end


