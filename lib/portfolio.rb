require_relative 'stock'

class Portfolio
attr_accessor :stocks
	def initialize
		@stocks = {}
	end

	def portfolio_value
		return 0 unless @stocks.any?
		total_value = 0
		@stocks.each do |ticker_sym, stock|
			total_value += get_market_value(ticker_sym.to_s, stock.shares)
		end
		return total_value.round(2)
	end

	def add_stock (tick_string, number)
		tick_sym = tick_string.to_sym
		
		unless @stocks[tick_sym]
			@stocks[tick_sym] = Stock.new(tick_string, number)
		else
			@stocks[tick_sym].add_shares number
		end
	end

	def remove_stock (tick_sym, number)
		stock = @stocks[tick_sym]
		if stock == nil 
			return false
		elsif stock.shares < number
			return false
		elsif stock.shares == number
			@stocks.delete(tick_sym)
			return true
		else
			stock.remove_shares number
			true
		end
	end

	def has_stocks_in?(tick_sym)
		return false unless stocks[tick_sym]
		true
	end

end



