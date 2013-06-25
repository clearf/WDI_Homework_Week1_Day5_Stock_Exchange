require 'pry'
require 'yahoofinance'
require 'rspec'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'
require_relative 'bank.rb'

# Open brokerage
awesome_brokerage = Bank.new

# Set up client 1
client1_thomas = Client.new("Thomas", 10000)
awesome_brokerage.clients << client1_thomas
client1_thomas.open_acct("Thomas first account")
client1_thomas.open_acct("Thomas second account")
client1_thomas.buy_stock("AAPL", 10, "Thomas first account")
client1_thomas.buy_stock("MS", 10, "Thomas first account")
client1_thomas.buy_stock("C", 20, "Thomas second account ")
client1_thomas.sell_stock("AAPL", 5, "Thomas first account")
client1_thomas.sell_stock("AAPL", 2, "Thomas first account")
client1_thomas.buy_stock("C", 10, "Thomas second account ")

# Set up client 2
client2_james = Client.new("James", 20000)
awesome_brokerage.clients << client2_james
client2_james.open_acct("James first account")
client2_james.open_acct("James second account")
client2_james.buy_stock("NIHD", 100, "James first account")
client2_james.buy_stock("GS", 30, "James second account ")
client2_james.sell_stock("GS", 20, "James second account")

# Show all client lists
awesome_brokerage.list_clients

# Show portfolio summary
client1_thomas.show_port_summary("Thomas first account")
client1_thomas.show_port_summary("Thomas second account")
client2_james.show_port_summary("James first account")
client2_james.show_port_summary("James second account")

# Show client summary
client1_thomas.show_client_summary
client2_james.show_client_summary


