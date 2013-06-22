require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'bank'

#Created Bank
ez_bank = Bank.new

#Created Clients
ez_bank.new_client("gandalf", 100)
ez_bank.new_client("god", 20)
# shows client list
# ez_bank.clients.each {|key, value| puts key}

#Created Portfolios
ez_bank.clients["gandalf"].new_portfolio("money maker")
ez_bank.clients["god"].new_portfolio("world atm")

#Add Stocks to Portfolio

ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("AAPL", 200)
ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("MNKD", 100)
ez_bank.clients["gandalf"].portfolios["money maker"].buy_stock("GOOG", 300)

# shows portfolio name
ez_bank.clients["gandalf"].portfolios.each { |key, value| puts value.name}
# shows stock ticker, price, and total value (with shares) of Portfolio
ez_bank.clients["gandalf"].portfolios["money maker"].stocks.each {|key, value| puts value}

####
puts ""
puts "Apple's new iPhone received terrible reviews. As a result, Gandalf sold all his Apple stock."
puts ""
#not working
ez_bank.clients["gandalf"].portfolios["money maker"].sell_stock("AAPL")
ez_bank.clients["gandalf"].portfolios["money maker"].stocks.each {|key, value| puts value}







#client_1 = Client.new("Gandalf", 1000000)
#client_2 = Client.new("God", 20)
