require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance = 0, portfolio)
    @name = name
    @balance = balance
    @portfolio = {}
  end

  # def to_s
  #   return "#{@name} just created a new account with #{@balance} dollars. "
  # end
end

class Portfolio
  attr_accessor :ticker, :shares, :quote
  def initialize(ticker, shares, quote)
    @ticker = ticker
    @shares = shares
    @quote = quote
  end
end

def quote
  YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade
end

p quote

# c1 = Client.new("Sarah", 20)
# c2 = Client.new("David", 1000)

# puts c1
# puts c2

class Firm
  attr_accessor :clients
  def initialize
    @clients = []
  end

  def to_s
    return "A total of #{@clients.count} client(s) have active accounts. #{@clients[0].name.to_s} just created a new account with #{@clients[0].balance.to_s} dollars. #{@clients[0].name.to_s}'s portfolio has #{@clients[0].portfolio.inspect} shares"
  end
end

jpmorgan = Firm.new
jpmorgan.clients << Client.new("Sarah", 20)
jpmorgan.clients[0] << Portfolio.new("AAPL", 5, 400)
# jpmorgan.clients << Client.new("David", 1000)

puts jpmorgan


