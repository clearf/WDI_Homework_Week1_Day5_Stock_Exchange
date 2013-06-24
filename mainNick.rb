require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = []
  end
  def new_client
    puts "new client? (y/n)"
    response = gets.chomp
      if response == 'y'
        puts "new clients name:"
        name = gets.chomp.to_s
        puts "enter starting balance:"
        balance = gets.chomp.to_f
        puts "new account created for #{name}\nbalance: #{balance}"
      end
  end
  def make_portfolio(portfolio_id)
    portfolio = Portfolio.new(portfolio_id)
    # puts portfolio.inspect
  end
  def buy_stock
    puts "client: #{name}"
    puts "buy stock? (y/n)"
    response = gets.chomp
    if response == 'y'
      # puts "choose portfolio: #{portfolio}"
      puts "enter ticker:"
      ticker_buy = gets.chomp.upcase
      puts "enter shares:"
      bought_shares = gets.chomp.to_i
      market_price = "#{YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker_buy)[ticker_buy].lastTrade}"
      total_cost = bought_shares.to_i * market_price.to_f
      puts "total cost: #{total_cost}"

      puts portfolios.portfolio_contents.inspect

      # new_balance =
    end
  end
  def sell_stock
  end
end

class Portfolio
  attr_accessor :portfolio_id, :portfolio_contents, :value
  def initialize(portfolio_id)
    @portfolio_id = portfolio_id
    @portfolio_contents = []
    @value = value
  end
end

class Stock
  attr_accessor :ticker, :shares
  def initialize(ticker, shares)
    @ticker = ticker
    @shares = shares
  end
end

c1 = Client.new("Sarah", 20000)
c1.make_portfolio(1)
c1.buy_stock
puts c1.inspect

# Client.new.new_client

