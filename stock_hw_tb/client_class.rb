# GA Stock Exchange Lab
# code by Christine Coulter and Tom Brennan

require 'pry'
require 'yahoofinance'

# Create Client class

class Client
  attr_accessor :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
  end

YahooFinance::get_quotes
  (YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

end
