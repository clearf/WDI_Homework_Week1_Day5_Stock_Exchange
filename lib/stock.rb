require 'yahoofinance'

class Stock

  attr_reader :name
  attr_accessor :total_price, :num_of_shares

  def initialize(name, num_of_shares)
    @name = name
    @num_of_shares = num_of_shares
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade ) * num_of_shares
  end

  def get_price
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade ) * num_of_shares
    return @total_price
  end

  def get_share_price
    return YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
  end

end
