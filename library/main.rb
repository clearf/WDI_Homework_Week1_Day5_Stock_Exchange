require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
# require_relative 'portfolio'

clients = []

ben=Client.new("Ben", 100000)
puts "#{ben.name} is a new client, with a balance of $#{ben.balance}."
clients << ben

puts "#{ben.name} creates Portfolio 1 and Portfolio 2."
ben.portfolio[:portfolio1] = []
ben.portfolio[:portfolio2] = []

puts "#{ben.name} buys 100 shares of AAPL and 100 shares of JMBA for Portfolio 1."
s1 = Stock.new("AAPL", 100)
s2 = Stock.new("jmba", 100)

puts "#{ben.name} buys 100 shares of C and 100 shares of NFLX for Portfolio 2."
s3 = Stock.new("C", 100)
s4 = Stock.new("nflx", 100)

ben.portfolio[:portfolio1] = [s1, s2]
ben.portfolio[:portfolio2] = [s3, s4]

portfolio1_value = 0
portfolio2_value = 0


ben.portfolio[:portfolio1].each do |stock|
  portfolio1_value += stock.value
end

ben.portfolio[:portfolio2].each do |stock|
  portfolio2_value += stock.value
end

total_value = portfolio1_value + portfolio2_value

puts
puts "Portfolio 1 value is $ #{portfolio1_value}"
puts "Portfolio 2 value is $ #{portfolio2_value}"
puts "The total value is $#{total_value}"

total_balance = (ben.balance - total_value.to_f)

puts "Balance is $#{total_balance}."

puts
puts "Portfolio 1 stocks are "

ben.portfolio[:portfolio1].each do |stock|
  puts stock.ticker
end

puts
puts "Portfolio 2 stocks are "

ben.portfolio[:portfolio2].each do |stock|
  puts stock.ticker
end

puts
puts "#{ben.name} sells all of his #{s4.ticker} stock."

ben.portfolio[:portfolio2].pop

portfolio2_value = portfolio2_value - s4.value
total_value = portfolio1_value + portfolio2_value
total_balance = (ben.balance - total_value.to_f)

puts "Portfolio 2 value is now $ #{portfolio2_value}"
puts "The total value is now $#{total_value}"
puts "Balance is now $#{total_balance}."

puts
puts "Clients are "

clients.each do |client|
  puts client.name
end