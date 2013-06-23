require 'yahoofinance'

class Stock

  attr_reader :name
  attr_accessor :total_price, :num_of_shares

  def initialize(name, num_of_shares)
    @name = name
    @num_of_shares = num_of_shares
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade ) * num_of_shares
  end

  def buy_shares(num_of_shares_to_buy)
    num_of_shares += num_of_shares_to_buy
    get_total_price
  end

  def sell_shares(num_of_shares_to_sell)
    if num_of_shares_to_sell <= num_of_shares
      num_of_shares -= num_of_shares_to_sell
      get_total_price
    else
      puts "You don't have #{num_of_shares_to_sell} shares to sell."
    end
  end

  def get_total_price
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade ) * num_of_shares
    return @total_price
  end

  def get_share_price
    return YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
  end

end
