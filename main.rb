require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'bank'

#Create Bank
ez_bank = Bank.new
puts "\nThe bank has no clients, show client list:\n"
ez_bank.list_clients()

#Create Clients
jeff_jones = ez_bank.new_client("Jeff Jones", 50000000)
mary_deluca = ez_bank.new_client("Mary DeLuca", 20)
kira_macdonald = ez_bank.new_client("Kira MacDonald", 100000)
puts "\nThe bank now has clients, show client list:\n"
ez_bank.list_clients()
puts ""
ez_bank.show_client_report(jeff_jones)
ez_bank.show_client_report(mary_deluca)
ez_bank.show_client_report(kira_macdonald)

#Create Portfolios
jeff_high_risk = jeff_jones.new_portfolio("High Risk")
mary_low_risk = mary_deluca.new_portfolio("Low Risk")
mary_high_risk = mary_deluca.new_portfolio("High Risk")
jeff_medium_risk = jeff_jones.new_portfolio("Medium Risk")
kira_medium_risk = kira_macdonald.new_portfolio("Medium Risk")

# Buy and sell some stocks
puts "Current value of Jeff's stocks: $" + sprintf("%.2f", jeff_jones.value_of_all_stocks).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
jeff_jones.buy_stock("AAPL", 100, "High Risk")
puts "\nCurrent value of Jeff's stocks: $" +sprintf("%.2f", jeff_jones.value_of_all_stocks).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
jeff_jones.sell_stock("AAPL", 100, "High Risk")
puts "\nCurrent value of Jeff's stocks: $" + sprintf("%.2f", jeff_jones.value_of_all_stocks).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
puts "\nClient Reports: "
ez_bank.show_client_report(jeff_jones)





