# Code by Christine Coulter and Tom Brennan
# Build the stock class

# require pry for testing
require 'pry'

# Stock class
class Stock
  attr_accessor :ticker, :name, :price, :sector
  def initialize(ticker, name, price, sector)
    @ticker = ticker
    @name = name
    @price = 1
    @sector = sector
end

s1 = Stock.new("CSCO", "Cisco Systems", 1, "Technology")

puts s1

end