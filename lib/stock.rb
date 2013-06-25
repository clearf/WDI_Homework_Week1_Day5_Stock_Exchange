require 'yahoofinance'

class Stock
	attr_reader :ticker_string, :shares

	def initialize(ticker_string, shares)
		@ticker_string = ticker_string
		@shares = shares
	end

	def add_shares (num_shares)
		@shares += num_shares
	end

	def remove_shares (num_shares)
		@shares -= num_shares
	end

	def get_price
		@shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, @ticker_string)[@ticker_string].lastTrade
	end
end


