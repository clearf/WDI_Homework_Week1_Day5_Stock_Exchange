require_relative 'client'
require_relative 'stock'
require_relative 'bank'

class Portfolio
    attr_accessor :stocks, :name

    def initialize(name)
      @name = name
      @stocks = {}
    end


    def buy_stock(ticker, num_shares)
        stock = Stock.new(ticker, num_shares)
        @stocks[ticker] = stock
    end

    def sell_stock(name)
      @stocks.delete(name)
    end

    def balance
      puts @stocks.keys
      total = 0
      @stocks.each { |key, stock| total += stock.value }
      puts total
    end
end
