require 'yahoofinance'
require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'

puts "Here's a new client. His name is Barnie Maddoc, and he has $2,452,496 in liquid assets."
puts "Welcome, Barnie!"

barnie = Client.new("Barnie Maddoc", 2452496)

tech_stocks = { 'ORCL' => Stock.new('ORCL', 100),
                'TTGT' => Stock.new('TTGT', 100),
                'DMRC' => Stock.new('DMRC', 100) }

pf = Portfolio.new("Technology", tech_stocks)

barnie.add_portfolio(pf)
puts "Barnie has "
barnie.portfolios.each do |p|
  puts p
end

puts "Barnie wants to sell all his shares of ORCL."

barnie.sell_stock('ORCL', 100, "Technology")

puts barnie
barnie.portfolios.each { |p| puts p }