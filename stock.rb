class Stock
  attr_accessor :ticker, :market_price, :share

  def initialize(ticker, market_price, share)
    @ticker = ticker
    @market_price = market_price
    @share = share
  end



end