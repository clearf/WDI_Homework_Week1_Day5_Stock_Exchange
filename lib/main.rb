require 'yahoofinance'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'

# creates an array and puts clients in a list

clients = []

clients << Client.new("Barnie Maddoc", 2452496)
clients << Client.new("Stevie Ray Vaughn", 233423)
clients << Client.new("Sally Jones", 1232421)

# create portfolios of stocks

tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                'TTGT' => Stock.new('TTGT', 100),
                'DMRC' => Stock.new('DMRC', 100)}
p1 = Portfolio.new("Tech", tech_stocks)

meds_stocks = { 'COO' => Stock.new('COO', 100),
                'MGLN' => Stock.new('MGLN', 100),
                'AMGN' => Stock.new('AMGN', 100)}
p2 = Portfolio.new("Meds", meds_stocks)

bio_stocks = { 'ARNA' => Stock.new('ARNA', 1000),
               'BIIB' => Stock.new('BIIB', 1000),
               'BPAX' => Stock.new('BPAX', 1000), }
p3 = Portfolio.new("Bio", bio_stocks)

meds_stocks_2 = { 'COO' => Stock.new('COO', 750),
                'MGLN' => Stock.new('MGLN', 800),
                'AMGN' => Stock.new('AMGN', 9000)}
p4 = Portfolio.new("Meds", meds_stocks_2)
# Assign portfolios hash to client

clients[0].add_portfolio(p1)
clients[1].add_portfolio(p2)
clients[2].add_portfolio(p3)
clients[2].add_portfolio(p4)

# Prints the program

puts "Welcome to the Stock Tracker!"
puts ""
puts "Here is our client list."
clients.each do |c|
  puts "\n#{c}"
  c.portfolios.each do |name, p|
    puts p
  end
end

puts "\nStevie bought a tech portfolio just like Barnie's, but with 10 times the shares."

tech_stocks_2 = { 'ORCL' => Stock.new('ORCL', 1000),
                'TTGT' => Stock.new('TTGT', 1000),
                'DMRC' => Stock.new('DMRC', 1000)}
clients[1].add_portfolio(Portfolio.new("Tech"))
clients[1].buy_stock('ORCL', 1000, "Tech")
clients[1].buy_stock('TTGT', 1000, "Tech")
clients[1].buy_stock('DMRC', 1000, "Tech")

puts clients[1]
clients[1].portfolios.each { |p| puts p }

puts "\nNot to be outdone, Barnie is adding a medical portfolio just like Stevie's, but bigger."

clients[0].add_portfolio(Portfolio.new("Meds"))
clients[0].buy_stock('COO', 1000, "Meds")
clients[0].buy_stock('MGLN', 1000, "Meds")
clients[0].buy_stock('AMGN', 1000, "Meds")

puts clients[0]
clients[0].portfolios.each { |p| puts p }

puts "\nSally is just tired of this. She wants to sell all her shares of ARNA."

clients[2].sell_stock('ARNA', 1000, "Bio")
puts clients[2]

puts "\nStevie's lost it, guys. He's trying to buy a million shares in Apple."
puts "Sorry, I can't let you do that, Stevie."
clients[1].buy_stock('AAPL', 1000000, "Tech")

puts "\nAfter seeing what happened to Stevie, Barnie has realized this isn't the kind of life he wants to lead."
puts "He's going to become a Buddhist monk."
puts "But first, he's going to cash out."

clients[0].portfolios.each do |name, portfolio|
  clients[0].delete_portfolio(name)
end

puts clients[0]

puts"\nJust another day on Wall Street."
