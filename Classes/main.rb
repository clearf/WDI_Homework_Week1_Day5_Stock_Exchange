require 'pry'
require 'yahoofinance'

require_relative 'client'
require_relative 'portfolio'
require_relative 'trade'
require_relative 'stock'

##Begin back-end info for clients, portfolios

puts `clear`

ponzi_scheme = Brokerage.new ##Creates "shelter" for clients to go into

#Initial clients
bob = Client.new("Bob", 50000)
mary = Client.new("Mary", 45000)

#Adding initial clients to ponzi_scheme client "shelter"
ponzi_scheme.add_client bob
ponzi_scheme.add_client mary

#Initial clients portfolios
bob.portfolios[:portfolio_1] = Portfolio.new("Bob's Industrial Portfolio", 10000)
bob_s1 = Stock.new('BA',34)
bob_s2 = Stock.new('FDX',45)

bob.portfolios[:portfolio_1].stocks << bob_s1
bob.portfolios[:portfolio_1].stocks << bob_s2

bob.portfolios[:portfolio_2] = Portfolio.new("Bob's Energy Stocks", 10000)
bob_s3 = Stock.new('XOM',400)
bob.portfolios[:portfolio_2].stocks << bob_s3

mary.portfolios[:portfolio_1] = Portfolio.new("Mary's Financial Services Portfolio", 10000)
mary_s1 = Stock.new('UBS',1)
mary_s2 = Stock.new('GS',45)
mary_s3 = Stock.new('MS',55)
mary_s4 = Stock.new('WF',34)

mary.portfolios[:portfolio_1].stocks << mary_s1
mary.portfolios[:portfolio_1].stocks << mary_s2
mary.portfolios[:portfolio_1].stocks << mary_s3
mary.portfolios[:portfolio_1].stocks << mary_s4

#Begin story
puts "$$$ Welcome to Ponzi Financial, where the money flows freely! $$$"

puts "\nAs a prospective client, you may be interested in learning about our existing clients."
puts "\nOur existing clients include:"
ponzi_scheme.list_clients

puts "\nHere at Ponzi Financial, ethics are a low priority. To that extent, here is an overview of Bob's portfolios:"
puts ""

puts bob.portfolios[:portfolio_1]
bob.portfolios[:portfolio_1].stocks.each {|stock| puts stock}
bob_1_total = bob_s1.total_price + bob_s2.total_price
puts "For a total invested value of $#{bob_1_total.to_i}"
puts ""

puts bob.portfolios[:portfolio_2].to_s
bob.portfolios[:portfolio_2].stocks.each {|stock| puts stock}
bob_2_total = bob_s3.total_price
puts "For a total invested value of $#{bob_2_total.to_i}"

puts "\nAnd here is an overview of Mary's portfolio:"
puts mary.portfolios[:portfolio_1].to_s
mary.portfolios[:portfolio_1].stocks.each {|stock| puts stock}
mary_1_total = mary_s1.total_price + mary_s2.total_price + mary_s3.total_price + mary_s4.total_price #inefficient, make more efficient
puts "For a total invested value of $#{mary_1_total.to_i}"


puts "\nAre you interested in becoming a customer?"
puts "\nGreat, we will add your information to our client list"

don = Client.new("Don", 45000) #Don's initial information
ponzi_scheme.add_client don

puts "\nHere is the updated list of clients:"
ponzi_scheme.list_clients

puts "\nDon, the new client, wants to purchase 10 shares of AAPL"

don.portfolios[:portfolio_1] = Portfolio.new("Don", 10000)

don.portfolios[:portfolio_1].buy_stock('AAPL',10)

puts "\nDon's portfolio now looks like:"

don.portfolios[:portfolio_1].stocks.each {|stock| puts stock}

puts "\nDon decides to sell a portion of his AAPL stock"
don.portfolios[:portfolio_1].sell_stock('AAPL',4)

puts "\nDon's portfolio now looks like:"

don.portfolios[:portfolio_1].stocks.each {|stock| puts stock}


