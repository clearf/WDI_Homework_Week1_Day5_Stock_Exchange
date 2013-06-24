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

# create portfolios of stocks

  tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                  'TTGT' => Stock.new('TTGT', 100),
                  'DMRC' => Stock.new('DMRC', 100),}
      p1 = Portfolio.new("tech", tech_stocks)

  meds_stocks = { 'COO' => Stock.new('COO',   100),
                  'MGLN' => Stock.new('MGLN', 100),
                  'AMGN' => Stock.new('AMGN', 100) }
      p2 = Portfolio.new("meds", meds_stocks)

  bio_stocks = { 'ARNA' => Stock.new('ARNA', 100),
                 'BIIB' => Stock.new('BIIB', 100),
                 'BPAX' => Stock.new('BPAX', 100), }
      p3 = Portfolio.new("bio", bio_stocks)

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



