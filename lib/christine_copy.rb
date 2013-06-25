# Code by Christine Coulter and Tom Brennan
require 'pry'
require 'YahooFinance'

class Broker
  attr_accessor :clients
  def initialize()
    @clients = []
  end

###puts name of each instance of client
  def client_list
    @clients.each do |item|
      puts "List of clients:"
      puts "----------------------------------------------"
      puts item.name
    end
  end

###searches through array of instances of client for the one with the client name
###puts account balance of client
###iterates through client's portfolios and calls get_value function in portfolio class
###calculates value of all portfolios as 'client_value'
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


###searches through array of instances of client class
###finds the client object and searches through arrays of portfolio instances
###puts stocks in portfolio
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


###creates new portfolio if it doesn't already exist and pushes it to array of portfolios
  def create_portfolio()
    puts "Portfolio name?"
    desired_name = gets.chomp
    ###calls has_portfolio function
    if has_portfolio(desired_name)
      puts "You already have a portfolio with the name #{desired_name}"
    else
      @portfolios << Portfolio.new(desired_name)
    end
  end

###searches through array of instances of portfolio to see if a particular instance exists and returns boolean
  def has_portfolio(desired_name)
    found_portfolio = false
    @portfolios.each do |item|
      if item.name == desired_name
        found_portfolio = true
      end
    end
    found_portfolio
  end

###checks if client has enough money in balance to buy shares of a stock
  def buy_stock(portfolio_name, ticker, number_of_shares_to_buy)
    current_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker.upcase)[ticker.upcase].lastTrade
    total_value = number_of_shares_to_buy * current_price
    if @balance >= total_value
      ###calls has_portfolio function
      if has_portfolio(portfolio_name)
        @portfolios.each do |item|
          ###calls add_stock function in portfolio class
          ###updates balance
          if item.name == portfolio_name
            item.add_stock(ticker, number_of_shares_to_buy)
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

###checks if client has enough shares to sell
  def sell_stock(portfolio_name, ticker, number_of_shares_to_sell)
    total_value = number_of_shares_to_sell * ticker.price
    ###calls has_portfolio function
    if has_portfolio(portfolio_name)
      @portfolios.each do |item|
        if item.name == portfolio_name
          ###calls get_shares_of_stock function in portfolio class
          ###updates balance
          if item.get_shares_of_stock(ticker) >= number_of_shares_to_sell
            item.remove_stock(ticker, number_of_shares_to_sell)
            @balance += total_value
          else
            puts "You do not have enough #{ticker.ticker.upcase} shares to sell #{number_of_shares_to_sell} shares."
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


###searches through stocks array of stock instances and returns boolean
  def has_stock(ticker)
    found_stock = false
    @stocks.each do |item|
      if item.ticker == ticker
        found_stock = true
      end
    end
    found_stock
  end

###searches through stocks array of stock instances
###updates number of shares of particular stock (add)
###pushes stock into stocks array if new
  def add_stock(ticker, number_of_shares)
    if has_stock(ticker)
      @stocks.each do |item|
        if item.ticker == ticker
          item.shares += number_of_shares
        end
      end
    else
      @stocks << Stock.new(ticker, number_of_shares)
    end
  end


###searches through stocks array of stock instances
###updates number of shares of particular stock (subtract)
  def remove_stock(ticker, number_of_shares)
    @stocks.each do |item|
      if item.ticker == ticker
        item.shares -= number_of_shares
      end
    end
  end

###returns number of shares of stock
  def get_shares_of_stock(ticker)
    number_of_shares = 0
    @stocks.each do |item|
      if item.ticker == ticker
        number_of_shares = item.shares
      end
    end
    number_of_shares
  end

###returns value of portfolio instance by summing values of shares of stock
###calls get_value function in stock class
  def get_value
    portfolio_value = 0
    @stocks.each do |stock|
      portfolio_value += stock.get_value
    end
    portfolio_value
  end

  def to_s
    puts "#{@name} Portfolio has the following stocks:"
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


###returns value of shares of stock
  def get_value
    current_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker.upcase)[@ticker.upcase].lastTrade
    current_price * @shares
  end


  def to_s
    current_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker.upcase)[@ticker.upcase].lastTrade
    return "#{@shares} shares of #{@ticker.upcase} (currently trading at #{current_price})"
  end
end



#####Hardcode examples#######
csco = Stock.new("csco", 100)
ibm = Stock.new("ibm", 500)
wen = Stock.new("wen", 0)
# p1 = Portfolio.new("tech")
# p2 = Portfolio.new("food")
client1 = Client.new("Alphonse Von der Strudel", 1000)
# client1.portfolios << p1 << p2
# p1.stocks << csco
# client1.create_portfolio("tech")
# client1.create_portfolio("food")
# client1.buy_stock("csco","tech",100)
# client1.buy_stock("ibm","tech",500)
# client1.buy_stock("wen","food",1)



#####Gives readout#####

#puts "#{client1.name}'s balance = $#{client1.balance}"


# client1.buy_stock(s1, 200)
# client1.buy_stock(s3, 100)
# client1.sell_stock(s1, 100)
# client1.sell_stock(s2, 400)
# client1.withdraw_cash
#puts "----------------------------"

#puts "#{client1.name}'s balance = $#{client1.balance}"

binding.pry
