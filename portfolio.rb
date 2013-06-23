require_relative 'stock'

class Portfolio
    attr_accessor :stocks, :name

    def initialize(name)
      @name = name
      @stocks = {}
    end

    # Lists all stocks in the portfolio.
    def list_stocks()
      puts "List of all stocks in the #{@name} portfolio: "
      @stocks.each {|name, stock| puts name}
    end

    # Returns the total monetary value of the portfolio.
    def get_portfolio_value()
      value = 0
      @stocks.each {|name, stock| value += stock.get_price * stock.num_shares}
      return value
    end

end
