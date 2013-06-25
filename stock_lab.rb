require	'yahoofinance'

class Stock
	attr_reader :ticker, :number_of_shares
	# ticker
	# number of shares
	def initialize(ticker, number_of_shares)
		@ticker = ticker
		@number_of_shares = number_of_shares
	end	

	def buy_shares(shares_to_buy)
		# @number_of_shares = @number_of_shares + shares_to_add
		@number_of_shares += shares_to_add
	end

	def selling_shares(shares_to_sell)
		# @number_of_shares = @number_of_shares + shares_to_add
		if shares_to_sell < @number_of_shares
			@number_of_shares -= shares_to_sell
		else
			return false
		end
	end

	def get_price
		return YahooFinance::get_quotes(YahooFinance::StandardQuote, 
			@ticker)[@ticker].lastTrade
	end	
end

class Portfolio
	# value
	# portfolio_name
	def initialize
		@stocks={}
	end	

	def add_stock(ticker, number_of_shares)
		if @stocks[ticker]
			# we already have a stock that exists
		else
			# we need to add a stock object
		end
	end
end	

class Client
	# cash_balance
	def initialize
		@portfolios = {}
	end	
end	

new_stock = Stock.new('AAPL', 100)
puts "#{new_stock.ticker}, #{new_stock.number_of_shares} shares, $#{new_stock.get_price}"
# XXX Lots of other code