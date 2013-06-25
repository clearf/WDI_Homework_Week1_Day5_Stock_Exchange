require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'
require_relative 'bank'

def number_to_currency(num)
  sprintf("%.2f", num).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
end

#Create Bank
ez_bank = Bank.new

#Create Clients
mary_deluca = ez_bank.new_client("Mary DeLuca", 20)
kira_macdonald = ez_bank.new_client("Kira MacDonald", 100000)


#Create Portfolios
mary_high_risk = mary_deluca.new_portfolio("High Risk")
mary_low_risk = mary_deluca.new_portfolio("Low Risk")
kira_medium_risk = kira_macdonald.new_portfolio("Medium Risk")

puts "Welcome to EZ bank. Here is our current client list:"
ez_bank.list_clients()
puts ""
puts "My name is Jeff Jones. I would like to become a client."
puts "Here is 50000000."
puts ""
jeff_jones = ez_bank.new_client("Jeff Jones", 50000000)
jeff_high_risk = jeff_jones.new_portfolio("High Risk")
jeff_medium_risk = jeff_jones.new_portfolio("Medium Risk")
jeff_low_risk = jeff_jones.new_portfolio("Low Risk")
puts "Great. We have created an account. Here is your account summary."
ez_bank.show_client_report(jeff_jones)
puts ""
puts "Thanks. Please purchase 100 shares of Apple and put them in my High Risk Portfolio."
jeff_jones.buy_stock("AAPL", 100, "High Risk")
puts ""
puts "Transaction completed."
puts ""
jeff_high_risk.list_stocks
puts ""
puts "News Update: Apple's new iPhone does not have wifi, but"
puts "it doubles as a toaster."
puts ""
puts "That is awful news. Please sell 50 shares of Apple."
jeff_jones.sell_stock("AAPL", 50, "High Risk")
puts "What is the status of my account?"
puts ""
ez_bank.show_client_report(jeff_jones)
puts ""
puts "Phew, thank god I am still rich!"
puts "Please purchase 10,000,000 shares of MNKD."
puts ""
jeff_jones.buy_stock("MNKD", 10000000, "Medium Risk")
puts ""
puts "Grrr, everyone has limits I guess."
puts "Please buy 100 shares of MNKD and put in my Medium Risk"
jeff_jones.buy_stock("MNKD", 100, "Medium Risk")
puts ""
puts "Summary of EZ Bank"
ez_bank.list_clients()
puts ""
ez_bank.show_client_report(mary_deluca)
ez_bank.show_client_report(kira_macdonald)
ez_bank.show_client_report(jeff_jones)

puts "Detailed view of stocks in Jeff's Portfolios:"
jeff_high_risk.list_stocks
jeff_medium_risk.list_stocks











