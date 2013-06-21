require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'



ben=Client.new("Ben", 125000)
ben.portfolio[:stock1] = Stock.new("AAPL")
ben.portfolio[:stock2] = Stock.new("JMBA")
puts ben.portfolio