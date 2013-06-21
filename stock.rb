class Stock
  attr_accessor :ticker
  def initialize(ticker)
      @ticker = ticker
    end
  def price
    puts YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
  end
end