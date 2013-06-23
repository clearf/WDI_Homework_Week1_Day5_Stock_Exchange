require 'yahoofinance'

class Stock
  attr_accessor :ticker, :num_shares

  def initialize(ticker, num_shares)
    @ticker = ticker
    @num_shares = num_shares
  end

  # Returns the price of the stock.
  def get_price()
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
    end
  end

end

