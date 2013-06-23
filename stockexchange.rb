require './client'
require './stock'
require 'yahoofinance'


# Create an account for client (name, balance).
kevin = Client.new("Kevin", 4_000_000)
puts "A new client, #{kevin.name}, has walked in.\n\n"

alina = Client.new("Alina", 1_000_000)

# Every client can create multiple portfolios.
kevin.create_portfolio("moneymaker")
kevin.create_portfolio("winner")

alina.create_portfolio("boss")
alina.create_portfolio("partylikearockstar")

# A client can buy stocks at market rate; these stocks will be added to a portfolio and the purchase amount subtracted from cash. (You cannot go to a negative cash balance).
kevin.buy_stock("AAPL", 5000, "moneymaker")
kevin.buy_stock("GOOG", 1000, "winner")
kevin.buy_stock("TSLA", 3000, "moneymaker")
kevin.buy_stock("SBAC", 7500, "winner")
kevin.buy_stock("GOOG", 300, "winner")
kevin.buy_stock("EGAS", 30000, "moneymaker")

alina.buy_stock("EXC", 1500, "boss")
alina.buy_stock("NOK", 500, "boss")
alina.buy_stock("AMT", 2500, "boss")
alina.buy_stock("AAPL", 300, "partylikearockstar")
alina.buy_stock("GOOG", 300, "partylikearockstar")



# A client can sell a stock. The proceeds go into his account.
kevin.sell_stock("AAPL", 2000, "moneymaker")
kevin.sell_stock("TSLA", 2000, "moneymaker")
kevin.sell_stock("SBAC", 4000, "winner")
kevin.sell_stock("GOOG", 300, "winner")

alina.sell_stock("NOK", 250, "boss")
alina.sell_stock("EXC", 1550, "boss") # designed to fail

# List all client portfolios and their values (each portfolio value and sum of portfolio values) and the account balance.
kevin.list_portfolio
alina.list_portfolio

# List all stocks in a portfolio.
kevin.list_stock("moneymaker")
kevin.list_stock("winner")
alina.list_stock("boss")

# List all clients.
Client.list_all