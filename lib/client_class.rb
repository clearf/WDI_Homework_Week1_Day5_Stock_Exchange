 # Code by Christine Coulter and Tom Brennan
require 'pry'

class Client
  attr_accessor :name, :balance, :portfolio
  def initialize
    @name = "Bob"
    @balance = 1000
    @portfolio = {}
  end

# Creates methods to enable Clients to buy and sell stocks
  def deposit_cash(deposit_amount)
    @balance += deposit_amount
  end

  def withdraw_cash(withdraw_amount)
    @balance -= withdraw_amount
  end

  def to_s
    return @portfolio
  end
end




# Stock class
class Stock
  attr_accessor :name, :ticker, :price, :sector, :shares
  def initialize(name, ticker, price, sector, shares)
    # Just 1 @ makes these instance variables,
    # If we had 2 @@ they would be class variables
    @name = name
    @ticker = ticker
    @price = 1
    @sector = sector
    @shares = shares
  end

# def get_price(ticker)
# YahooFinance::get_quotes(YahooFinance::StandardQuote,
#  'ticker')['ticker'].lastTrade
# end

  def to_s
    return "The ticker symbol for #{@name} is:#{@ticker}, which is currently
      trading at #{@price}. This company is in the #{@sector} sector. #{@shares}"
  end

  def buy_stock(number_of_stocks_to_buy)
    @shares += number_of_stocks_to_buy
  end

  def sell_stock(number_of_stocks_to_sell)
    @shares -= number_of_stocks_to_sell
  end
end

s1 = Stock.new("Cisco Systems", "CSCO", 1, "Technology", 100)
s2 = Stock.new("Wendy's", "WEN", 1, "Food", 200)
client1 = Client.new
client1.portfolio[:tech] = [s1]
client1.portfolio[:food] = [s2]

client1.portfolio.each do |stock, description|
  puts description
end


s1.buy_stock(100)
s2.sell_stock(100)
client1.portfolio.each do |stock, description|
  puts description
end

binding.pry



