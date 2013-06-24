require 'pry'
require 'yahoofinance'
require 'rspec'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'
require_relative 'bank.rb'

awesome_brokerage = Bank.new

client1_thomas = Client.new("Thomas", 10000)
awesome_brokerage.clients << client1_thomas
client1_thomas.open_acct("Thomas first account")
client1_thomas.open_acct("Thomas second account")
client1_thomas.buy_stock("AAPL", 10, "Thomas first account")
client1_thomas.buy_stock("C", 20, "Thomas second account ")
client1_thomas.sell_stock("AAPL", 5, "Thomas first account")
client1_thomas.sell_stock("AAPL", 5, "Thomas first account")

client2_james = Client.new("James", 20000)
awesome_brokerage.clients << client2_james
client2_james.open_acct("James first account")
client2_james.open_acct("James second account")
client2_james.buy_stock("NIHD", 100, "James first account")
client2_james.buy_stock("GS", 30, "James second account ")
client2_james.sell_stock("GS", 20, "James second account")

awesome_brokerage.list_clients
