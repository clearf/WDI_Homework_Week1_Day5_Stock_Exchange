class Stock
  attr_accessor :ticker, :market_rate, :shares, :stock_name

  def initialize(ticker, shares)
    @ticker = ticker
    @shares = shares
    @market_rate = YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade * shares
  end

  def to_s
    puts "#{@ticker} has #{@shares} shares at a #{@market_rate} market rate."
  end
end
