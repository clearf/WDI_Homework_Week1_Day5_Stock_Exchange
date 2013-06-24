require_relative 'client'

# Created by: Teddy Cleveland
# Last modified: 06/23/2013
# Presentation of the stock-exchange simulation


puts `clear`

clients = {}
puts "welcome to the stock-exchange simulator\n\n"
puts "clients can create accounts and see other clients: "
puts

# creation of new clients
clients[:michael_white] = Client.new("michael white", 1000000)
clients[:jerry_smith] = Client.new("jerry smith", 200000)
clients[:linda_sparkles] = Client.new("linda sparkles", 90000)

# listing all clients
clients.each do |name, client|
	puts "	" + client.name
end

sleep(3)

puts
puts "clients can build multiple portfolios: "
puts

#creation of new portfolios
clients[:michael_white].new_portfolio("tech_invest")
clients[:michael_white].new_portfolio("business")
clients[:jerry_smith].new_portfolio("clean_energy")
clients[:jerry_smith].new_portfolio("home_grown")
clients[:jerry_smith].new_portfolio("computing_tech")
clients[:linda_sparkles].new_portfolio("beauty")

clients.each do |name, client|
	puts client.name
	puts
	client.list_all_portfolios
	puts
end

sleep(3)

puts 
puts "clients can buy stocks at market price: "
puts

# buying of stocks
clients[:michael_white].buy_stocks("tech_invest", "GOOG", 100)	
clients[:michael_white].buy_stocks("tech_invest", "AAPL", 200)	
clients[:michael_white].buy_stocks("tech_invest", "MSFT", 300)	
clients[:jerry_smith].buy_stocks("clean_energy", "BLDP", 1000)
clients[:jerry_smith].buy_stocks("clean_energy", "VRNM", 250)
clients[:jerry_smith].buy_stocks("home_grown", "MCD", 50)
clients[:jerry_smith].buy_stocks("home_grown", "CSCO", 150)
clients[:jerry_smith].buy_stocks("home_grown", "WMT", 100)
clients[:jerry_smith].buy_stocks("computing_tech", "IBM", 200)
clients[:linda_sparkles].buy_stocks("beauty","PG", 100)
clients[:linda_sparkles].buy_stocks("beauty", "LRLCY", 20)

sleep(3)

# printing portfolio values
puts
puts "clients can view their portfolio's values"
puts

clients.each do |name, client|
	client.list_all_portfolios
end

sleep(3)

puts
puts "clients can sell stocks at market price: "
puts

#selling of stocks
clients[:michael_white].sell_stocks("tech_invest", "AAPL", 140)	
clients[:michael_white].sell_stocks("tech_invest", "MSFT", 280)	
clients[:jerry_smith].sell_stocks("clean_energy", "VRNM", 100)
clients[:jerry_smith].sell_stocks("home_grown", "MCD", 30)
clients[:jerry_smith].sell_stocks("home_grown", "WMT", 10)
clients[:jerry_smith].sell_stocks("computing_tech", "IBM", 20)
clients[:linda_sparkles].sell_stocks("beauty", "LRLCY", 20)

sleep(3)

# printing portfolio values
puts
puts "and then view the changes in their portfolio values"
puts

clients.each do |name, client|
	client.list_all_portfolios
end

puts
puts "thanks for checking out the stock-exchange simulator"
puts
