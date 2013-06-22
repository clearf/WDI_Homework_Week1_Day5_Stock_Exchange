require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'



ben=Client.new("Ben", 100000)

ben.portfolio[:portfolio1] = []
ben.portfolio[:portfolio2] = []

s1 = Stock.new("AAPL", 100)
s2 = Stock.new("jmba", 100)

s3 = Stock.new("C", 100)
s4 = Stock.new("nflx", 100)

ben.portfolio[:portfolio1] = [s1, s2]
ben.portfolio[:portfolio2] = [s3, s4]

# puts ben.portfolio

total_value = 0

ben.portfolio[:portfolio1].each do |stock|
  total_value += stock.value
end

ben.portfolio[:portfolio2].each do |stock|
  total_value += stock.value
end

puts total_value

total_balance = (ben.balance - total_value.to_f)

puts "Balance is $#{total_balance}."

# ben.portfolio

# ben.portfolio[:stock1] = Stock.new("AAPL",10)
# ben.portfolio[:stock2] = Stock.new("JMBA",10)

# puts ben.portfolio[:stock1].value


# puts ben.portfolio[:stock1].price
# puts ben.portfolio[:stock2].price