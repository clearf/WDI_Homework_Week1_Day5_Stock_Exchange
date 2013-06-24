require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance, :portfolio, :updated_balance
  def initialize(name, balance = 0)
    @name = name
    @balance = balance
    @portfolio = {}
    @updated_balance = balance.to_i
  end
  def to_s
    return "Account Holder: #{name} \nBalance: #{updated_balance} \nPortfolio: #{@portfolio[:portfolio_1].portfolio_name} \nStock: #{@portfolio[:portfolio_1].ticker} \nShares: #{@portfolio[:portfolio_1].shares} \nLive Quote: #{@portfolio[:portfolio_1].quote} \nPortfolio Value: #{@portfolio[:portfolio_1].value}\n"
  end
end


class Portfolio
  attr_accessor :portfolio_name, :portfolio_contents, :ticker, :shares, :quote, :value
  def initialize(portfolio_name, ticker, shares)
    @portfolio_name = portfolio_name
    @portfolio_contents = {}
    @ticker = ticker
    @shares = shares
    @quote = live_quote
    @value = shares * live_quote
  end
  def live_quote
  client = YahooFinance::StandardQuote.new
  live_quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, "#{ticker}")["#{ticker}"].lastTrade
  end
end



c1 = Client.new("Sarah", 20)
c1.portfolio[:portfolio_1] = Portfolio.new("Tech Portfolio", "AAPL", 5)
c1.portfolio[:portfolio_2] = Portfolio.new("Food Portfolio", "CMG", 5)

puts c1

puts c1.balance + c1.portfolio[:portfolio_1].value

