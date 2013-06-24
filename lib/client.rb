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

  def buy_stock(stock_name, num_of_shares, portfolio_name)
    stock = Stock.new(stock_name, num_of_shares)
    if stock.total_price > balance
      puts "Transaction cannot be completed. The client does not have enough money."
      return false
    else
      portfolios[portfolio_name].buy_stock(stock)
      @balance -= cost
    end
  end

  def sell_stock(stock_name, num_of_shares, portfolio_name)
    portfolio = portfolios[portfolio_name]
    if portfolio.sell_stock
      income = 0
      stocks.each do |stock|
        income += stock.get_price * num_of_shares
      end
      @balance += income
    else
      puts "The transaction was not completed."
    end
  end

end
