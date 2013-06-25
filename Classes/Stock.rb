require 'yahoofinance'

require_relative 'client'
require_relative 'portfolio'
require_relative 'trade'


class Stock

  attr_reader :ticker
  attr_accessor :total_price, :num_of_shares, :portfolio_name, :sym

  def initialize(ticker, num_of_shares)
    @ticker = ticker
    @num_of_shares = num_of_shares
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade ) * num_of_shares
  end

  def get_block_price
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade ) * num_of_shares
    return @total_price
  end

  def get_share_price
    return YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker)[@ticker].lastTrade
  end

  def to_s
    "#{@num_of_shares} shares of #{@ticker}, currently priced at #{get_share_price} each"
  end

  def buy_stock(sym, num_of_shares, portfolio_name, balance)
    stock = Stock.new(sym, num_of_shares)
    if stock.total_price > balance
      puts "Error: Not enough money in account."
      return false
    else
      cost = stock.total_price
      portfolios[portfolio_name].buy_stock(sym, num_of_shares)
      @balance -= cost
    end
  end

#   def sell_stock(sym, num_of_shares_to_sell, portfolio_name)
#     portfolio = portfolios[portfolio_name]
#     income = portfolio.sell_stock(sym, num_of_shares_to_sell)
#     unless income == false
#       @balance += income
#     else
#       puts "The transaction was not completed."
#     end
#   end

end
