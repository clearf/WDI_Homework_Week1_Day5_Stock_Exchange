require 'yahoofinance'

	def get_price(ticker)
		YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
	end

	def get_market_value(ticker, shares)
		shares * get_price(ticker)
	end

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


end


