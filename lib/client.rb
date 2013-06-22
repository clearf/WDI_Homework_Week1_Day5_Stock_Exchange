class Client

  attr_accessor :name, :balance, :portfolios, :portfolios_total_value

  def initialize(name, balance, portfolios = {})
    @name = name
    @balance = balance
    @portfolios = portfolios
    @portfolios_total_value = update_total_portfolios_value
  end

  def update_total_portfolios_value
    total_value = 0
    portfolios.each do |portfolio|
      total_value += portfolio.calculate_value
    end
  end

  def add_portfolio(portfolio)
    portfolios << portfolio
  end

  def delete_portfolio(portfolio_name)
    portfolios.delete(portfolio_name)
  end

  # This method isn't pretty
  def buy_stock(stock_name, num_of_shares, portfolio_name)
    # if stock is already in portfolio, assign it to stock variable
    if portfolios[portfolio_name].has_stock?(stock_name)
      stock = portfolios[portfolio_name].stocks[stock_name]
      cost = stock.get_share_price * num_of_shares

    # otherwise, create a new Stock object
    else
      stock = Stock.new(stock_name, num_of_shares)
      cost = stock.total_price
    end

    if cost > @balance
      puts "Transaction cannot be completed. The client does not have enough money."
    else
      @balance -= cost

      # Note: I don't like this line much because in the case where a new
      # Stock object was created, num_of_shares is entirely redundant
      portfolios[portfolio_name].add_stock(stock, num_of_shares)
    end

  end

  # Not pretty either
  # Just straight up... not pretty
  def sell_stock(portfolio_name, stock_name, num_of_shares)
    if portfolios[portfolio_name].hasStock?(stock_name)
      if num_of_shares <= portfolios[portfolio_name].stocks[stock_name].num_of_shares
        portfolios[portfolio_name].stocks[stock_name].num_of_shares -= num_of_shares
        income = 0
        stocks.each do |stock|
          income += stock.get_price * num_of_shares
        end
        @balance += income
      else
        puts "The client does not have enough stock to sell."
      end
    else
      puts "The client doesn't own any of that stock."
    end
  end

end
