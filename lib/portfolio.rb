
require_relative 'stock.rb'
require_realtive 'yahoofinance'


class Portfolio
 attr_accessor :portfolio_name, :portfolio, :stocks, :value

  def initialize(portfolio_name, portfolio = {})
    @portfolio_name = portflio_name
    @value = value
  end

  def delete_stock
    portfolio.delete(stock)
  end

  def add_stock
    portfolio << stock
  end


  def calculate_value
    value = 0
    portfolio.each do |stock|
    value += stock.total_price
    end
  end
end
