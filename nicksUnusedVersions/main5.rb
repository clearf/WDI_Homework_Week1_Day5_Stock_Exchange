require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolio, :updated_balance
  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @portfolio = {}
    @updated_balance = balance.to_i
  end
  def to_s
    return "Account Holder: #{name} \nBalance: #{updated_balance} \nPortfolio: #{@portfolio[:portfolio_1].portfolio_name} \nStock: #{@portfolio[:portfolio_1].ticker} \nShares: #{@portfolio[:portfolio_1].shares} \nLive Quote: #{@portfolio[:portfolio_1].quote} \nPortfolio Value: #{@portfolio[:portfolio_1].value}\n"
  end
end


class Portfolio
  attr_accessor :portfolio_name, :portfolio_contents, :ticker, :shares, :quote, :value
  def initialize(portfolio_name)
    @portfolio_name = portfolio_name
    @portfolio_contents = []
    @ticker = ticker
    @shares = shares
    @quote = quote
    @value = value
  end
end

def live_quote(ticker)
client = YahooFinance::StandardQuote.new
live_quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, "#{ticker}")["#{ticker}"].lastTrade
end

class Buy
  attr_accessor :ticker, :shares
  def initialize(ticker, shares)
    @ticker = ticker
    @shares = shares
  end
end

# creates new client
c1 = Client.new("Sarah", 20)
# adds portfolios
c1.portfolio[:portfolio_1] = Portfolio.new("Tech Portfolio")
c1.portfolio[:portfolio_2] = Portfolio.new("Food Portfolio")

# buys stocks and adds to portfolio_contents
c1.portfolio[:portfolio_1].portfolio_contents << Buy.new("YHOO", 9)
c1.portfolio[:portfolio_1].portfolio_contents << Buy.new("MCD", 11)

#shows name, first stock, shares, live quote in portfolio_1
puts "Portfolio Name: " + c1.portfolio[:portfolio_1].portfolio_name
puts "Ticker: " + c1.portfolio[:portfolio_1].portfolio_contents[0].ticker
puts "Shares: " + c1.portfolio[:portfolio_1].portfolio_contents[0].shares.to_s
puts "Live Quote: #{live_quote("#{c1.portfolio[:portfolio_1].portfolio_contents[0].ticker}")}"

#lists all contents of portfolio_1
c1.portfolio[:portfolio_1].portfolio_contents.each do |ticker, shares|
  puts "Ticker: #{ticker}"
  puts "Shares: #{shares}"
end


