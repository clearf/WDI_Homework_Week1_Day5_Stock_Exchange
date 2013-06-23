require_relative 'stock.rb'
require 'yahoofinance'


class Portfolio

 attr_accessor :portfolio_name, :stocks, :value

  def initialize(portfolio_name, stocks = {})
    @portfolio_name = portflio_name
    @stocks = stocks

    # Calculates the total portfolio value without accessing the API again.
    # This assumes that all stocks were instantiated as they were passed
    # to the constructor (Stock objects access the API when instantiated)
    @value = 0
    portfolio.each do |stock|
      @value += stock.total_price
    end
  end

  # Takes a Stock object and either adds it to the hash
  # or updates the amount of shares of an already-present stock
  def buy_stock(stock)
    if portfolio(stock.name)
      portfolio(stock.name).num_of_shares = stock.num_of_shares
    else
      portfolio << stock
    end
  end

  # Returns true if the transaction succeeded and false if it failed
  def sell_stock(stock_name, num_of_shares_to_sell)
    stock = portfolio(stock_name)
    if stock == nil
      puts "The client doesn't own any of that stock."
      return false
    elsif stock.num_of_shares < num_of_shares_to_sell
      puts "The client doesn't have #{num_of_shares_to_sell} shares in #{stock_name} to sell."
      return false
    elsif stock.num_of_shares > num_of_shares_to_sell
      stock.num_of_shares -= num_of_shares_to_sell
      return true
    else
      portfolio.delete(stock_name)
      return true
    end
  end

  def calculate_value
    @value = 0
    portfolio.each do |stock|
      @value += stock.get_total_price
    end
  end

  def to_s
      return "the #{@portfolio_name} containing #{@stocks} is worth #{@value}."
  end
end
