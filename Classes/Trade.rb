class Trade ##Can probably delete this object

  attr_accessor :stock_symb, :num_of_shares, :cost_per_share, :portfolio_name

  def initialize
    @stock_symb = stock_symb
    @num_of_shares = num_of_shares
    @cost_per_share =
    @portfolio_name = []
    @buy_sell = [] #this variable is not defined above
  end

  def buy(stock_symb, num_of_shares, portfolio_name)
    # if stock is already in portfolio, assign it to stock variable
    if portfolios[portfolio_name].has_stock?(stock_symb)
      stock = portfolios[portfolio_name].stocks[stock_symb]
      cost = stock.get_block_price

    # otherwise, create a new Stock object
    else
      stock = Stock.new(stock_symb, num_of_shares)
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
end


