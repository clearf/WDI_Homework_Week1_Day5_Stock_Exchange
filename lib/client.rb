class Client

  attr_accessor :name, :balance, :portfolios, :portfolios_total_value

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
    @portfolios_total_value = 0
  end

  def update_total_portfolios_value
    @portfolios_total_value = 0
    if portfolios.any?
      portfolios.each do |name, portfolio|
        @portfolios_total_value += portfolio.calculate_value
      end
    end
    return @portfolios_total_value
  end

  def add_portfolio(portfolio)
    portfolios[portfolio.name] = portfolio
  end

  def delete_portfolio(portfolio_name)
    income = portfolios[portfolio_name].calculate_value
    @balance += income
    portfolios.delete(portfolio_name)
  end

  def buy_stock(stock_name, num_of_shares_to_buy, portfolio_name)
    stock = Stock.new(stock_name, num_of_shares_to_buy)
    if stock.total_price > balance
      puts "Transaction cannot be completed. The client does not have enough money."
      return false
    else
      cost = stock.total_price
      portfolios[portfolio_name].buy_stock(stock_name, num_of_shares_to_buy)
      @balance -= cost
    end
  end

  def sell_stock(stock_name, num_of_shares_to_sell, portfolio_name)
    portfolio = portfolios[portfolio_name]
    income = portfolio.sell_stock(stock_name, num_of_shares_to_sell)
    unless income == false
      @balance += income
    else
      puts "The transaction was not completed."
    end
  end

  def to_s
    return "The client, #{@name}, has a total cash balance of $#{@balance}, and has #{@portfolios.length} portfolio(s) worth $#{update_total_portfolios_value}."
  end

end
