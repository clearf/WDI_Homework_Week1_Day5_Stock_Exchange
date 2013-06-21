require 'yahoofinance'

class Stock

  attr_reader :name
  attr_accessor :price

  def initialize(name)
    @name = name
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
  end

  def get_price
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
    return @price
  end

end
