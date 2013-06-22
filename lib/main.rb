require 'pry'
require 'yahoofinance'
require 'rspec'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'

  # NEED TO CHECK FOR PORTFOLIO NAME

dummy_client = Client.new("Thomas", 10000)
dummy_client.open_acct("First dummy account")
dummy_client.open_acct("Second dummy account")
# dummy_client.portfolios.each { |x| puts x.port_name}
dummy_client.buy_stock("AAPL", 10, "First dummy account")
dummy_client.sell_stock("AAPL", 5, "First dummy account")




# price_quote = Stock.get_price(ticker)
# total_value = shares * price_quote

# test_portfolio = Portfolio.new("Test Portfolio")

# test_portfolio.add_stock("AAPL", 1000)
# puts test_portfolio.portfolio_bal

# test_portfolio.remove_stock("AAPL", 500)
# puts test_portfolio.portfolio_bal

# puts test_portfolio.composition[:AAPL]


