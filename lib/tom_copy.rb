# Code by Christine Coulter and Tom Brennan
require 'pry'
require 'YahooFinance'

class FinancialInstitution
  attr_accessor :clients
  def initialize()
    @clients = []
  end

  def client_list
  end

  def client_portfolios_list
  end

  def client_portfolios_stocks_list
  end
end


class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = []
  end

#updates client's balance after depositing money
  def deposit_cash()
    puts "Deposit amount?"
    deposit_amount = gets.to_f
    @balance += deposit_amount
  end

#updates client's balance after withdrawing money
#will not let allow client to withdraw more money than balance
  def withdraw_cash()
    puts "Withdrawal amount?"
    withdraw_amount = gets.to_f
    while @balance < withdraw_amount
      puts "You do not have enough money to withdraw that amount."
      puts "Try again. Withdrawal amount?"
      withdraw_amount = gets.to_f
    end
    @balance -= withdraw_amount
  end

#updates client's balance after buying stock and updates portfolio
#adds stock to portfolio if stock does not already exist in portfolio
#won't let client buy shares if balance is not high enough
  def buy_stock(stock, number_of_shares_to_buy)
    total_value = number_of_shares_to_buy * stock.price
    if @balance >= total_value
      stock.shares += number_of_shares_to_buy
      @balance -= total_value
      unless @portfolio.include?(stock)
      @portfolio << stock
      end
    else
      puts "You do not have enough money to buy that many shares."
    end
  end

#updates client's balance after selling stock and updates portfolio
#deletes stock from portfolio if client sold all of the shares
### To Do: Add logic to check if you own that many shares
  def sell_stock(stock, number_of_shares_to_sell)
    stock.shares -= number_of_shares_to_sell
    total_value = number_of_shares_to_sell * stock.price
    @balance += total_value
    if stock.shares == 0
      @portfolio.delete(stock)
    end
  end

  def to_s
    return "#{@name} has a balance of #{@balance}."
  end
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

# def get_price(ticker)
# YahooFinance::get_quotes(YahooFinance::StandardQuote,
#  'ticker')['ticker'].lastTrade
# end

  def to_s
    return "The ticker symbol for #{@stock_name} is :#{@ticker}, \nwhich is currently trading at #{@price}. This company is in the #{@sector} sector. #{@shares}"
  end
end



#####Hardcode examples#######
s1 = Stock.new("Cisco Systems", "CSCO", YahooFinance::get_quotes(YahooFinance::StandardQuote, 'CSCO')['CSCO'].lastTrade, "Technology", 100)
s2 = Stock.new("IBM", "IBM", 1, "Technology", 500)
s3 = Stock.new("Wendy's", "WEN", 1, "Food", 0)
client1 = Client.new("Alphonse Von der Strudel", 100000)
client1.portfolio << s1
#client1.portfolio << s2


#portfolio is an array and items are instances of the stock class
#####Gives readout#####

puts "#{client1.name}'s balance = $#{client1.balance}"



client1.buy_stock(s1, 200)
# client1.buy_stock(s3, 100)
# client1.sell_stock(s1, 100)
# client1.sell_stock(s2, 400)
# client1.withdraw_cash
puts "----------------------------"

puts "#{client1.name}'s balance = $#{client1.balance}"




