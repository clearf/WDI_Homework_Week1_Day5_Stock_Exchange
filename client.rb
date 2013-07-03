require_relative "stock"

###########################################################################################################Class Client

class Client
  attr_accessor :name, :balance, :portfolios, :ticker, :stock_value, :port_name, :market_rate, :portfolio_count, :new_stock

  def initialize(name,balance)
    @name = name
    @balance = balance
    @portfolios = {}
    @portfolio_count = 0
  end

  def make_new_portfolio(port_string)
    port_sym = port_string.to_sym
    @portfolios[port_sym] = []
    @portfolio_count += 1
  end

  def buy_stock(ticker, shares, port_string)
    @ticker = ticker
    @shares = shares
    @stock_value = shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    @balance = balance

    if balance.to_i < stock_value.to_i
      puts "Sorry, you don't have enough moneys to purchase this stock."
    else
      @new_stock = Stock.new(ticker, shares)
      @balance -= stock_value.to_i
      #puts "Thank you for purchasing this stock, #{@name}! Your new balance is $#{@balance}."# This stock was added to your portfolio."
      @portfolios[port_string.to_sym] << @new_stock
      return @new_stock
    end
  end

  def sell_stock(stock, num_shares_to_sell, port_string)
    if stock == nil
      puts "You do not have this stock in your portfolio."
    elsif
      stock.shares < num_shares_to_sell
      puts "You do not have enough shares to sell."
    else
      stock.shares -= num_shares_to_sell
      @balance += (stock.shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade)
      @portfolios[port_string.to_sym].delete_if{|x|x.shares == 0}
    end
      #puts "Thank you for selling this stock, #{@name}! Your new balance is $#{@balance}."
  end

  def total_port_value(port_string)
    total = 0
    temp_port = @portfolios[port_string.to_sym]
    temp_port.each do |stocks|
      total_value = (stocks.market_rate * stocks.shares)
      total += total_value
    end
    return total
  end

  def list_client_portfolios
    puts "#{@name} has #{@portfolio_count} portfolios and a $#{@balance} account balance, and a total sum of portfolio values of "
    self.portfolios.each do |port_title,stocks|
      puts "#{@name}'s #{port_title} portfolio:"
      "#{stocks}"
      puts "This portfolio is valued at $#{self.total_port_value(port_title)}"
      puts ""
    end
  end

  def Client.list_all_clients
    puts "Our clients are:"
    ObjectSpace.each_object(Client) {|client| print "#{client}, "}
  end

  def to_s
    "#{@name}"
  end
end

########################################################################################################Class Portfolio
class Portfolio
  attr_accessor :port_name, :stocks

  def initialize(port_name)
    @port_name = port_name
    @stocks = {}
  end
end

############################################################################################################Class Stock
