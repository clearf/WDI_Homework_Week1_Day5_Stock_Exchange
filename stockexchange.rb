require './client'
require './stock'
# require './portfolio' # Portfolio class is not neccessary
require 'yahoofinance'
require 'pry'


# Create an account for client (name, balance).
kevin = Client.new("Kevin", 10_000_000)
puts "A new client, #{kevin.name} has walked in.\n\n"

alina = Client.new("Alina", 2_000_000)

# Every client can create multiple portfolios.
kevin.create_portfolio("nyse")
kevin.create_portfolio("hkse")

# A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
kevin.buy_stock("AAPL", 5000, "nyse")
kevin.buy_stock("GOOG", 1000, "hkse")
kevin.buy_stock("TSLA", 3000, "nyse")
kevin.buy_stock("SBAC", 7500, "hkse")

# A client can sell a stock. The proceeds go into his account.
kevin.sell_stock("AAPL", 2000, "nyse")
kevin.sell_stock("TSLA", 2000, "nyse")
kevin.sell_stock("SBAC", 4000, "hkse")

# List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
kevin.list_portfolio #missing the port values

# List all stocks in a portfolio.
kevin.list_stock("nyse")
kevin.list_stock("hkse")

# List all clients.
Client.list_all

# binding.pry