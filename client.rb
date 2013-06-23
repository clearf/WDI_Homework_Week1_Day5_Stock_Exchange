require_relative 'portfolio'
require_relative 'stock'

class Client
  attr_accessor :portfolios, :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  # Create a new portfolio and add it to the
  # portfolio list.
  def new_portfolio(name)
    portfolio = Portfolio.new(name)
    portfolios[name] = portfolio
    return portfolio
  end

  # Buys a stock by adding the stock amount to the
  # desired portfolio and subtracting the cost from
  # the client's cash balance.
  def buy_stock(ticker, num_shares, portfolio)
    stock = @portfolios[portfolio].stocks[ticker]

    if stock
      stock.num_shares += num_shares
    else
      stock = Stock.new(ticker, num_shares)
      @portfolios[portfolio].stocks[ticker] = stock
    end

    price = stock.get_price
    cost = price * num_shares

    if @balance >= cost
      @balance -= cost
    else
      puts "Client cannot afford to buy #{num_shares} shares of" +
           "#{ticker} stock at #{price} dollars per share."
    end

  end

  # Sells a stock by removing the requested number of shares
  # and adding the proceeds to the cash balance.
  def sell_stock(ticker, num_shares, portfolio)
    stock = @portfolios[portfolio].stocks[ticker]
    stock.num_shares -= num_shares
    @balance -= stock.get_price
  end

  # Returns the total value of all stocks
  # in all of a client's portfolios.
  def value_of_all_stocks
    stock_value = 0
    @portfolios.each {|name, portfolio|
        portfolio.stocks.each {|name, stock|
            stock_value += stock.get_price * stock.num_shares}}
    return stock_value
  end

end