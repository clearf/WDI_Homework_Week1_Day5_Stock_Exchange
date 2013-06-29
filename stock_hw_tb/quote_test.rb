require 'YahooFinance'

class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = []
  end

puts YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade

end