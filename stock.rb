require_relative 'portfolio'
require 'yahoofinance'

#require 'Gemfile'

class Stock
  attr_accessor :price, :ticker, :num_shares

  def initialize(ticker, num_shares)
    @ticker = ticker
    @num_shares = num_shares
    @price = get_price
    @value = (@price * @num_shares)
  end

  def get_price
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
    end
  end

  def to_s
    "#{@ticker} , P = #{@price} , NAV = #{@value})"
  end
end


#Stock.get_price('MNKD')

#my_stock = Stock.new("MNKD", 20)
#puts my_stock
