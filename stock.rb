class Stock
  attr_accessor :ticker
  def initialize(ticker, shares)
      @ticker = ticker.upcase
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
      @shares = shares
  end

  # def price
  #   puts YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
  # end

  def value
    @price * @shares
  end

end