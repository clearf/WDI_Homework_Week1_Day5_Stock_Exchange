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
			total_value += stock.get_price
		end
		return total_value.round(2)
	end

	def add_stock (tick_string, number)
		tick_sym = tick_string.to_sym
		if @stocks[tick_sym] == nil
			@stocks[tick_sym] = Stock.new(tick_string, number)
		else
			@stocks[tick_sym].add_shares number
		end
	end

	def remove_stock (tick_sym, number)
		if @stocks[tick_sym] == nil
			return false
		elsif @stocks[tick_sym].shares < number
			return false
		elsif @stocks[tick_sym].shares == number
			@stocks.delete(tick_sym)
			return true
		else
			@stocks[tick_sym].remove_shares number
			true
		end
	end

	def has_stocks_in?(tick_sym)
		return false if stocks[tick_sym] == nil
		true
	end

end



