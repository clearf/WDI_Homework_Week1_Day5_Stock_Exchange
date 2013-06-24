# Code by Christine Coulter and Tom Brennan
require 'pry'
require 'YahooFinance'

class Broker
  attr_accessor :clients
  def initialize()
    @clients = []
  end

  def client_list
    @clients.each do |item|
      puts "List of clients:"
      puts "----------------------------------------------"
      puts item.name
    end
  end

  def client_portfolios_list(client_name)
    @clients.each do |client|
      if client.name == client_name
        client_value = 0
        puts "List of client portfolio for #{client.name}"
        puts "----------------------------------------------"
        puts "Account balance: #{client.balance}"
        client.portfolios.each do |portfolio|
          portfolio_value = portfolio.get_value
          puts "Portfolio: #{portfolio.name}, valued at $#{portfolio_value}"
          client_value += portfolio_value
        end
        puts "Total portfolio value: $#{client_value}"
      end
    end
  end

  def client_portfolios_stocks_list(client_name, portfolio_name)
    @clients.each do |client|
      if client.name == client_name
        client.portfolio.each do |portfolio|
          if portfolio.name == portfolio_name
            puts "List of stocks in portfolio: #{portfolio_name}"
            puts "----------------------------------------------"
            portfolio.stocks.each do |stock|
              puts stock
            end
          end
        end
      end
    end
  end
end

class Client
  attr_accessor :name, :balance, :portfolios
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = []
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

  def create_portfolio()
    puts "Portfolio name?"
    desired_name = gets.chomp

    if has_portfolio(desired_name)
      puts "You already have a portfolio with the name #{desired_name}"
    else
      @portfolios << Portfolio.new(desired_name)
    end
  end

  def has_portfolio(desired_name)
    found_portfolio = false
    @portfolios.each do |item|
      if item.name == desired_name
        found_portfolio = true
      end
    end
    found_portfolio
  end


  def buy_stock(portfolio_name, stock, number_of_shares_to_buy)
    total_value = number_of_shares_to_buy * stock.price
    if @balance >= total_value
      if has_portfolio(portfolio_name)
        @portfolios.each do |item|
          if item.name == portfolio_name
            item.add_stock(stock, number_of_shares_to_buy)
            @balance -= total_value
          end
        end
      else
        puts "You currently do not have that portfolio. You need to create it first."
      end
    else
      puts "You do not have enough money ($#{@balance} vs $#{total_value}) to buy #{number_of_shares_to_buy} shares."
    end
  end


  def sell_stock(portfolio_name, stock, number_of_shares_to_sell)
    if has_portfolio(portfolio_name)
      @portfolios.each do |item|
        if item.name == portfolio_name
          if item.get_shares_of_stock(stock) >= number_of_shares_to_sell
            item.remove_stock(stock, number_of_shares_to_sell)
          else
            puts "You do not have enough shares of #{stock} to sell #{number_of_shares_to_sell}."
          end
        end
      end
    else
      puts "You currently do not have that portfolio. You need to create it first."
    end
  end


  def to_s
    return "#{@name} has a balance of #{@balance}."
  end
end


class Portfolio
  attr_accessor :name, :stocks
  def initialize(name)
    @name = name
    @stocks = []
  end

  def has_stock(stock)
    found_stock = false
    @stocks.each do |item|
      if item.ticker == stock
        found_stock = true
      end
    end
    found_stock
  end


  def add_stock(stock, number_of_shares)
    if has_stock(stock)
      @stocks.each do |item|
        if item.ticker == stock
          stock.shares += number_of_shares
        end
      end
    else
      @stocks << Stock.new(stock, number_of_shares)
    end
  end

  def remove_stock(stock, number_of_shares)
    @stocks.each do |item|
      if item.ticker == stock
        stock.shares -= number_of_shares
      end
    end
  end


  def get_shares_of_stock(stock)
    number_of_shares = 0
    @stocks.each do |item|
      if item.ticker == stock
        number_of_shares = item.shares
      end
    end
    number_of_shares
  end

  def get_value
    portfolio_value = 0
    @stocks.each do |stock|
      portfolio_value += stock.get_value
    end
    portfolio_value
  end

  def to_s
    @stocks.each do |item|
      puts item
    end
  end

end


class Stock
  attr_accessor :ticker, :shares
  def initialize(ticker, shares)
    # Just 1 @ makes these instance variables,
    # If we had 2 @@ they would be class variables
    @ticker = ticker
    @shares = shares
  end

  def get_value
    price = 2
    return price * @shares
  end

# def get_price(ticker)
# YahooFinance::get_quotes(YahooFinance::StandardQuote,
#  'ticker')['ticker'].lastTrade
# end

  def to_s
    #TO DO: grab current price here
    price = 2
    return "#{@ticker} is currently trading at #{price}."
  end
end



#####Hardcode examples#######
s1 = Stock.new("CSCO", 100)
s2 = Stock.new("IBM", 500)
s3 = Stock.new("WEN", 0)
p1 = Portfolio.new("Tech")
p2 = Portfolio.new("Food")
client1 = Client.new("Alphonse Von der Strudel", 1000)
client1.portfolios << p1 << p2




#portfolio is an array and items are instances of the stock class
#####Gives readout#####

puts "#{client1.name}'s balance = $#{client1.balance}"


# client1.buy_stock(s1, 200)
# client1.buy_stock(s3, 100)
# client1.sell_stock(s1, 100)
# client1.sell_stock(s2, 400)
# client1.withdraw_cash
puts "----------------------------"

puts "#{client1.name}'s balance = $#{client1.balance}"

binding.pry



