require 'yahoofinance'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'

puts "Here's a new client. His name is Barnie Maddoc, and he has $2,452,496 in liquid assets."
puts "Welcome, Barnie!"

# creates an array and puts clients in a list

clients = []

clients << client1 = Client.new("Barnie Maddoc", 2452496)
clients << client2 = Client.new("Stevie Ray Vaughn", 233423)
clients << client3 = Client.new("Sally Jones", 1232421)
clients << client3 = Client.new("Peter Frampton", 3334553)

# create portfolios

p1 = Portfolio.new
p2 = Portfolio.new
p3 = Portfolio.new


# give the clients stocks as well

s1 = Stock.new("", 100)
s2 = Stock.new("", 50)
s3 = Stock.new("", 300)
s4 = Stock.new("", 24)

# put the stock in the stocks hash




# put the stocks hash in the portfolio hash




# Assign portfolios hash to client


# Prints the program

puts "Welcome to the Investment Bank"
puts ""
puts "Here is our Client list"
clients.each { }
puts ""
puts "Lets see the portfolios"
puts ""
client.portfolios.each {  }
puts ""



