require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'bank'

#Created Bank
ez_bank = Bank.new

#Created Clients
gandalf = ez_bank.new_client("gandalf", 50000)
god = ez_bank.new_client("god", 20)

#Created Portfolios
money_maker = gandalf.new_portfolio("money maker")
world_atm = god.new_portfolio("world atm")
gandalf.buy_stock("AAPL", 100, "money maker")
puts gandalf.value_of_all_stocks
gandalf.sell_stock("AAPL", 10, "money maker")
puts gandalf.value_of_all_stocks
ez_bank.show_client_report("gandalf")
ez_bank.list_clients()
money_maker.list_stocks()



#ez_bank.clients["gandalf"].buy_stock("AAPL", 100, "money maker")

#puts ez_bank.clients["gandalf"].portfolios["money maker"].n
#ez_bank.clients.each {|key, value| puts value.name; value.portfolios.each {|key, value| puts value.name}}
#Add Stocks to Portfolio
=begin
ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("AAPL", 200)
ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("MNKD", 100)
ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("GOOG", 300)

# shows portfolio name
ez_bank.clients["gandalf"].portfolios.each { |key, value| puts value.name}
# shows stock ticker, price, and total value (with shares) of Portfolio
ez_bank.clients["gandalf"].portfolios["money maker"].stocks.each {|key, value| puts value.print_stock_info}

puts ""
puts "Trying to put balance here:"
# shows portfolio balance
ez_bank.clients["gandalf"].portfolios["money maker"].balance

####
puts ""
puts "Apple's new iPhone received terrible reviews. As a result, Gandalf sold all his Apple stock."
puts ""

#Sells Stock
ez_bank.clients["gandalf"].portfolios["money maker"].sell_stock("AAPL")

#Prints Updated Balance
ez_bank.clients["gandalf"].portfolios["money maker"].stocks.each {|key, value| puts value.print_stock_info}
=end
