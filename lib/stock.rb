require 'yahoofinance'

class Stock

  attr_reader :name
  attr_accessor :share_price, :total_price, :num_of_shares

  def initialize(name, num_of_shares)
    @name = name
    @num_of_shares = num_of_shares

    # Although individual share price is not necessary for this program to fulfill
    # all of its functionality, it is useful for testing.
    @share_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
    @total_price = share_price * num_of_shares
  end

  # These methods seem to be unnecessary. Their functionality is fulfilled by the
  # Portfolio class. Is that the best way to do this...?

  # def buy_shares(num_of_shares_to_buy)
  #   num_of_shares += num_of_shares_to_buy
  #   get_total_price
  # end

  # def sell_shares(num_of_shares_to_sell)
  #   if num_of_shares_to_sell <= num_of_shares
  #     num_of_shares -= num_of_shares_to_sell
  #     get_total_price
  #     return true
  #   else
  #     puts "You don't have #{num_of_shares_to_sell} shares to sell."
  #     return false
  #   end
  # end

  def get_total_price
    @total_price = ( YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade ) * num_of_shares
    return @total_price
  end

  def get_share_price
    @share_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
    return @share_price
  end

end
