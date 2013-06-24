require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end
  def buy_stock(portfolio_name, ticker, shares)
    portfolio = portfolio_name.to_sym
    # error if not enough money or portfolio doesn't exist
    @portfolio[portfolio].buy_stock(portfolio_name, ticker, shares)
    deduct_money(shares * live_ticker(ticker))
    puts " #{name} bought #{shares} shares of #{ticker}"
  end
  def sell_stock(portfolio_name, ticker, shares)
    portfolio = portfolio_name.to_sym
    # error if portfolio doesn't exist
    ticker_sym = ticker.to_sym
    @portfolio[portfolio].sell_stock(portfolio_name, ticker, shares)
    @balance += shares * live_ticker(ticker)
    puts " #{name} bought #{shares} shares of #{ticker}"
  end
  def new_portfolio(portfolio_name)
    portfolio_new = portfolio_name.to_sym
    @portfolio[portfolio_new] = Portfolio.new
  end
  def list_portfolios
    @portfolios.each do |symbol, portfolio|
      print " " + symbol.to_s
      puts ": value: $#{portfolio.portfolio_value}"
      portfolio.stocks.each do |ticker_sym, stock|
      puts "#{ticker_sym.to_s}: #{stock.shares} shares: $#{stock.stocks_value}"
  end
  def live_ticker (live_ticker)
    return YahooFinance::get_quotes(YahooFinance::StandardQuote, live_ticker)[live_ticker].lastTrade
  end
  def add_money(amount)
    @balance += amount
  end
  def deduct_money(amount)
    @balance -= amount
  end
end
end

class Portfolio
  attr_accessor :stocks
  def initialize
    @stocks = {}
  end
  def portfolio_value
    total_value = 0
    @stocks.each do |ticker_sym, stock|
      total_value += stock.stocks_value
    end
    return total_value.round(2)
  end
  def add_stock (ticker, number)
    tick_sym = ticker.to_sym
    @stocks[tick_sym] = Stock.new(ticker, number)
  end
  def remove_stock (tick_sym, number)
    @stocks[tick_sym].shares -= number
  end
end

class Stock
  attr_accessor :live_ticker, :shares
  def initialize(live_ticker, shares)
      @live_ticker = live_ticker
      @shares = shares
  end
  def stocks_value
    @shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, @live_ticker)[@live_ticker].lastTrade
  end
end
end

# c1 = Client.new("Sarah", 20000)
# c1.inspect

binding.pry