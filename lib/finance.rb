require 'YahooFinance'

class Client
  attr_accessor :name, :account_balance, :portfolios

  def initialize(name, account_balance)
    @name = name
    @account_balance = account_balance.to_f
    @portfolios = {}
  end

  def create_portfolio(portfolio_name)
    portkey = portfolio_name.to_sym
    @portfolios[portkey] = Portfolio.new(portfolio_name)
  end

  def buy_stock(portfolio_name, stock_symbol, shares)
    portkey = portfolio_name.to_sym
    if @portfolios.has_key?(portkey) == false
      create_portfolio(portfolio_name)
    end
    stock_purchase = Stock.new(stock_symbol, shares)
    while stock_purchase.get_share_price == 0
      puts "Need an actual stock - please enter a valid stock symbol."
      stock_purchase.stock_symbol = gets.chomp
    end
    cost = stock_purchase.get_share_price * shares
    if @account_balance < (cost)
      puts "Your account balance is insufficient for this purchase."
    else
      puts "Sounds good! Let me take care of that for you."
      @portfolios[portkey].add_stock(stock_purchase)
      @account_balance -= cost
    end
  end

  def sell_stock(portfolio_name, stock_symbol, shares)
    stock_symbol = stock_symbol.upcase
    portkey = portfolio_name.to_sym
    if @portfolios.has_key?(portkey) == false
      puts "You don't have a portfolio with that name."
    else
      stock_sell = Stock.new(stock_symbol, shares)
      while stock_sell.get_share_price == 0
        puts "Need an actual stock - please enter a valid stock symbol."
        stock_sell.stock_symbol = gets.chomp
      end
      @portfolios[portkey].remove_stock(stock_sell)
      sale_money = stock_sell.get_share_price * shares
      @account_balance += sale_money
    end
  end

  def list_portfolios_and_balance
    sum_assets = 0
    @portfolios.each do |key, value|
      port = key.to_s
      portfolio_assets = value.portfolio_value
      puts "#{port} has a value of #{portfolio_assets}."
      sum_assets += portfolio_assets
    end
    puts "Sum of portfolio assets is #{sum_assets}."
    puts "Account balance is #{@account_balance}."
  end
end

class Portfolio
  attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = []
  end

  def list_stocks
    @stocks.each do |stock|
      stock_symbol = stock.stock_info[0]
      shares = stock.stock_info[1]
      puts "#{shares} shares of #{stock_symbol}."
    end
  end

  def portfolio_value
    total_value = 0
    @stocks.each do |stock|
      stock.stock_info[2] = stock.get_share_price
      total_value += stock.stock_info[1] * stock.stock_info[2]
    end
    return total_value.round(2)
  end

  def add_stock(new_stock)
    if new_stock.class != Stock
      puts "That's not a stock."
    else
      done = 0
      @stocks.each do |stock|
        if stock.stock_symbol == new_stock.stock_symbol
          stock.stock_info[1] += new_stock.shares
          stock.shares += new_stock.shares
          done += 1
        end
      end
      if done == 0
        @stocks << new_stock
      end
    end
  end

  def remove_stock(sold_stock)
    stock_to_zero = 0
    stocks.each do |stock|
      if sold_stock.stock_symbol == stock.stock_symbol
        if stock.shares > sold_stock.shares
          stock.shares -= sold_stock.shares
          stock.stock_info[1] -= sold_stock.shares
          puts "Amount of stock has been reduced."
        elsif stock.shares == sold_stock.shares
          stocks.delete(stock)
          puts "Amount of stock has been reduced to zero."
        else
          puts "You do not have enough shares to sell."
        end
      end
    end
  end

end

class Stock
  attr_accessor :stock_symbol, :shares, :price, :stock_info

  def initialize(stock_symbol, shares)
    @stock_symbol = stock_symbol.upcase
    @shares = shares
    @price = get_share_price
    @stock_info = [@stock_symbol, @shares, @price]
  end

  def get_share_price()
    begin
      return YahooFinance::get_quotes(YahooFinance::StandardQuote, @stock_symbol)[@stock_symbol].lastTrade
    rescue
      puts "This appears to be blank; please enter a stock symbol."
      @stock_symbol = gets.chomp
    retry
    end
  end
end

client_list = []

def print_list(list)
  list.each do |client|
    puts client.name
  end
end

# Add clients
client_list << john = Client.new('John Watson', 275000)
client_list << bill = Client.new('Bill Murray', 5)

john.create_portfolio("tech")
# john.portfolios[:tech].add_stock(apple)
# john.portfolios[:tech].add_stock(microsoft)
kellogg = Stock.new('K', 70)
chipotle = Stock.new('CMG', 250)
john.create_portfolio("food")
john.portfolios[:food].stocks.push kellogg
john.portfolios[:food].stocks.push chipotle

puts "John to buy 65 shares of AAPL."
john.buy_stock("tech", "AAPL", 65)
puts ""
puts "John to buy 400 shares of MSFT."
john.buy_stock("tech", "MSFT", 400)
puts ""
puts "John's tech portfolio stock list"
john.portfolios[:tech].list_stocks
puts ""
puts "John to buy 50 additional shares of AAPL."
john.buy_stock("tech", "AAPL", 50)
puts ""
puts "John's tech portfolio stock list"
john.portfolios[:tech].list_stocks
puts ""
puts "John to sell 25 shares of AAPL."
john.sell_stock("tech", "AAPL", 25)
puts ""
puts "John's tech portfolio stock list"
john.portfolios[:tech].list_stocks
puts ""
puts "John to buy 70 shares of K."
john.buy_stock("food", "K", 70)
puts ""
puts "John to buy 250 shares of CMG."
john.buy_stock("food", "CMG", 400)
puts ""
puts "John's food portfolio stock list"
john.portfolios[:food].list_stocks
puts ""
puts "John's portfolios and balance"
john.list_portfolios_and_balance
puts ""
puts "Bill tries to buy 1 share of MSFT."
bill.buy_stock("tech", "MSFT", 1)
puts ""
puts "Client List"
print_list(client_list)
