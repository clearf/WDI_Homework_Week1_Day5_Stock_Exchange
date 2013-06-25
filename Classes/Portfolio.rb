require_relative 'client'

require_relative 'trade'
require_relative 'stock'

class Portfolio
  attr_accessor :client, :balance , :stocks, :ticker
  def initialize(client, balance)
    @client = client #hardcoded for now
    @balance = balance #hardcoded for now, consider making it dynamic w/ method for market cap
    @stocks = []
  end

  def list_portfolio
    puts "The portfolio contains the following securities:"
    @stocks.each {|stock| puts stock}
  end

  def add_portfolio(portfolio)
    portfolios << portfolio ##shovels portfolio into portfolios array in Client.rb
  end

  def buy_stock(ticker, num_of_shares)
    stock = @stocks[ticker.to_i]
    if stock
      stock.num_of_shares += num_of_shares
    else
      @stocks[ticker.to_i] = Stock.new(ticker, num_of_shares)
    end
  end

  def to_s
    "#{@client}, with an uninvested balance of #{@balance} and investments in the following stocks:"
  end


  def sell_stock(ticker, num_of_shares)
    stock = @stocks[ticker.to_i]
    if stock == nil
      puts "The client does not currently own that stock"
      return false
    elsif stock.num_of_shares < num_of_shares
      puts "The client doesn't have #{num_of_shares} shares in #{ticker} to sell."
      return false
    elsif stock.num_of_shares > num_of_shares
      income = stock.get_share_price * num_of_shares
      stock.num_of_shares -= num_of_shares
      return income
    else
      income = stock.get_total_price
      @stocks.delete(ticker)
      return income
    end
  end
end