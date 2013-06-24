require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @portfolio = []
  end
end

class Portfolio
  attr_accessor :ticker, :shares, :quote
  def initialize(ticker, shares)
    @ticker = ticker
    @shares = shares
    @quote = []
  end
end

def live_quote
  client = YahooFinance::StandardQuote.new
  live_quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, "YHOO")["YHOO"].lastTrade #link to portfolio.ticker
end

p live_quote


# def quote
#   YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade
# end

# p quote


class Firm
  attr_accessor :clients
  def initialize
    @clients = {}
  end

  def to_s
    return "A total of #{@clients.count} client(s) have accounts. #{@clients[:client_1].name} created a new account with #{@clients[:client_1].balance} dollars. #{@clients[:client_1].name}'s portfolio has #{@clients[:client_1].portfolio[0].shares} shares of #{@clients[:client_1].portfolio[0].ticker} worth $#{live_quote} each."
  end
end

  # puts "{@clients[:client_1].portfolio[0].quote}"

  # def to_s
  #   return "A total of #{@clients.count} client(s) have active accounts. #{@clients[0].name.to_s} just created a new account with #{@clients[0].balance.to_s} dollars. #{@clients[0].name.to_s}'s portfolio has #{@clients[0].portfolio.inspect} shares"
  # end


jpmorgan = Firm.new
jpmorgan.clients[:client_1] = Client.new("Sarah", 20)
jpmorgan.clients[:client_1].portfolio << Portfolio.new("YHOO", 5)
# jpmorgan.clients << Client.new("David", 1000)

puts jpmorgan

puts "#{jpmorgan.clients[:client_1].portfolio[0].ticker}"


