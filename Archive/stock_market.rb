# Yahoofinance gem -- needs to be built out further
require 'pry'
require 'yahoofinance'

#Classes
class Client
  attr_accessor :name, :age, :gender, :cash_balance, :portfolio
  def initialize(name, age, gender, cash_balance)
    @name = name
    @age = age
    @gender = gender
    @cash_balance = cash_balance #Balance that is not already in a portfolio
    @portfolio = {}
  end

  def to_s
    return "#{@name}, a #{@age} year old #{@gender}, with $#{@cash_balance} of investable cash assets."
  end
end

class Portfolio
attr_accessor :investor, :strategy, :cash, :stocks
  def initialize(investor, strategy, cash)
    @investor = investor
    @strategy = strategy
    @cash = cash
    @stocks = []
  end

  def to_s
    return "#{@investor} owns a a #{@strategy}-focused portfolio with a $#{@cash} balance"
  end
end

class Stock
  attr_reader :name
  attr_accessor :price, :quantity
  def initialize(name, quantity)
    @name = name
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
    @quantity = quantity
  end

  def get_price
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @name)[@name].lastTrade
    return @price
  end

  def to_s
    return "#{@quantity} shares of #{@name}, realtime-priced at $#{@price}"
  end
end

##Existing clients
don = Client.new("Don",40,"male",50000)
betty = Client.new("Betty",40,"female",40000)

#Existing Portfolios
don.portfolio[:portfolio_1] = Portfolio.new("Don", "Small-cap ad agency", 10000)
don.portfolio[:portfolio_2] = Portfolio.new("Don", "Diversified industrials", 5000)
betty.portfolio[:portfolio_1] = Portfolio.new("Betty", "Small-cap", 5000)
betty.portfolio[:portfolio_2] = Portfolio.new("Betty", "Large-cap", 5000)


#Stocks owned (NOT on a per-client thing - this is just all the stocks all the people own)
don.portfolio[:portfolio_1].stocks << Stock.new('AAPL', 5)
#don.portfolio[:portfolio_2].stocks << Stocks.new###INCOMPLETE###
#betty.portfolio[:portfolio_1].stocks << Stocks.new###INCOMPLETE###
#betty.portfolio[:portfolio_2].stocks << Stocks.new###INCOMPLETE###
#sally.portfolio[:portfolio_1].stocks << Stocks.new###INCOMPLETE###

#STORY BELOW
puts "$$$ Welcome to Ponzi Financial, where the money flows freely! $$$"
puts ""
puts "As a prospective client, you may be wondering exactly whom we aim to serve."
puts "Our existing clients include:"
puts ""
puts don
puts betty
puts ""
puts "Here at Ponzi Financial, ethics are a secondary concern."
puts "To that end, I am more than happy to disclose further information about our other clients:"
puts ""
puts don.portfolio[:portfolio_1]
puts betty.portfolio[:portfolio_1]
puts ""
puts "I can see that you're quite enthused. Would you like to open an account?"
puts "Great, I'll get the paperwork"
puts ""

#Adds new client Sally
sally = Client.new("Sally",15,"female",5000)
sally.portfolio[:portfolio_1] = Portfolio.new("Sally", "Diversified", 5000)


#RETURNS TO STORY
puts sally
puts ""

#NEED TO FLESH OUT REST OF STORY BELOW. BELOW LINE PULLS STOCK PRICE CORRECTLY!
don.portfolio[:portfolio_1].stocks.each {|stocks| puts stocks}


#don.portfolio_1[portfolio_1].stocks.each {|stocks| puts stocks}
#puts don.portfolio_1[:unit_b]
#don.portfolio_1[:unit_b].renters.each {|renter| puts renter}

###THINGS TO BUILD OUT###
#Subtract cash from user's portfolio balance
#Ability to sell stock
#List all stocks in a portfolio
#Any others?

#Ability to pull in stock information from yahoo finance gem (already installed) DONE
#LIst clients and their portfolio amounts DONE
#List all clients DONE

