require 'yahoofinance'

class Stock
    attr_accessor :ticker_string, :shares
    def initialize(ticker_string, shares)
        @ticker_string = ticker_string
        @shares = shares
    end

    def stocks_value
	@shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker_string)[@ticker_string].lastTrade
    end
end


