require 'YahooFinance'

class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = []
  end

class Stock
  attr_accessor :stock_name, :ticker, :price, :sector, :shares
  def initialize(stock_name, ticker, price, sector, shares)
    # Just 1 @ makes these instance variables,
    # If we had 2 @@ they would be class variables
    @stock_name = stock_name
    @ticker = ticker
    @price = price
    @sector = sector
    @shares = shares
  end



#updates client's balance after buying stock
### To Do: Check if you can afford to buy
  def buy_stock(stock, number_of_shares_to_buy)
    stock.shares += number_of_shares_to_buy
    total_value = number_of_shares_to_buy * stock.price
    @balance -= total_value
    unless @portfolio.include?(stock)
      @portfolio << stock
    end
  end

#updates client's balance after selling stock
### To Do: Add logic to check if you own that many shares
  def sell_stock(stock, number_of_shares_to_sell)
    stock.shares -= number_of_shares_to_sell
    total_value = number_of_shares_to_sell * stock.price
    @balance += total_value
  end

def to_s
    return "The ticker symbol for #{@stock_name} is :#{@ticker}, \nwhich is currently trading at #{@price}. This company is in the #{@sector} sector. #{@shares}"
  end

client1 = Client.new("Paul O'Neill", 100000)

s1 = Stock.new("Cisco", "CSCO", 1, "tech", 1000)

puts "#{client1.name}'s balance = $#{client1.balance}"

client1.buy_stock(s1, 100)

puts "#{client1.name}'s balance = $#{client1.balance}"

puts YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

    end
  end

