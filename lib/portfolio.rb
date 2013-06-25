require 'yahoofinance'
require_relative 'stock.rb'

class Portfolio

 attr_accessor :name, :stocks, :value

  def initialize(name, stocks = {})
    @name = name
    @stocks = stocks
    # Calculates the total portfolio value without accessing the API again.
    # This assumes that all stocks were instantiated as they were passed
    # to the constructor (Stock objects access the API when instantiated)
    @value = 0
    if stocks.any?
      @stocks.each do |name, stock|
        @value += stock.total_price
      end
    end
  end

  # Takes a Stock object and either adds it to the hash
  # or updates the amount of shares of an already-present stock
  def buy_stock(stock_name, num_of_shares)
    stock = @stocks[stock_name]
    if stock
      stock.num_of_shares += num_of_shares
    else
      @stocks[stock_name] = Stock.new(stock_name, num_of_shares)
    end
  end

  # Returns true if the transaction succeeded and false if it failed
  def sell_stock(stock_name, num_of_shares_to_sell)
    stock = @stocks[stock_name]
    if stock == nil
      puts "The client doesn't own any of that stock."
      return false
    elsif stock.num_of_shares < num_of_shares_to_sell
      puts "The client doesn't have #{num_of_shares_to_sell} shares in #{stock_name} to sell."
      return false
    elsif stock.num_of_shares > num_of_shares_to_sell
      income = stock.get_share_price * num_of_shares_to_sell
      stock.num_of_shares -= num_of_shares_to_sell
      return income
    else
      income = stock.get_total_price
      @stocks.delete(stock_name)
      return income
    end
  end

  def calculate_value
    @value = 0
    stocks.each do |name, stock|
      @value += stock.get_total_price
    end
    return @value
  end

  def to_s
    "The portfolio '#{@name}' containing #{@stocks.length} stocks is worth $#{@value}."
  end
end
