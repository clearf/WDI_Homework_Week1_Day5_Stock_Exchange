
require_relative 'portfolio'

class Client

	attr_accessor :name, :balance, :portfolios
	def initialize(name, balance)
		@name = name
		@balance = balance.to_f
		@portfolios = {}
	end

	############################################################
      ####################interfacing functions######################### 
      ############################################################


      #(function called from Stock-Exchange.rb)
	def buy_stocks(port_name, tick_string, num_stocks)
		port_sym = port_name.to_sym
		return false unless enough_money?(tick_string, num_stocks) && portfolio_exists?(port_sym)
		@portfolios[port_sym].add_stock(tick_string, num_stocks)
		spend_money(get_market_value(tick_string, num_stocks))
		puts "	#{@name} just bought #{num_stocks} shares in #{tick_string}"
	end

	def sell_stocks(port_name, tick_string, num_stocks)
		port_sym = port_name.to_sym
		tick_sym = tick_string.to_sym
		return false unless portfolio_exists?(port_sym) && enough_stocks?(port_sym, tick_sym, num_stocks)
		@portfolios[port_sym].remove_stock(tick_sym, num_stocks)
		@balance += get_market_value(tick_string, num_stocks)
		puts "	#{@name} just sold #{num_stocks} of his/her shares in #{tick_string}"
	end

	#creates a new portfolio
	def new_portfolio(port_name)
		return false if port_name.class != String #returns false if 
		port_sym = port_name.to_sym
		return false if portfolio_exists?(port_sym) #return false if portfolio exists alread
		@portfolios[port_sym] = Portfolio.new #otherwise creates new portfolio
		true
	end

	#lists all of the current portfolios, if any
	def list_all_portfolios
		unless @portfolios.any? 
			puts "You currently don't have any portfolios, try adding a few"
			return false
		end 
		@portfolios.each do |symbol, portfolio|
			print "	" + symbol.to_s
			unless portfolio.stocks.any? then
				puts ": empty portfolio"
			else
				puts ": value: $#{portfolio.portfolio_value}"
				portfolio.stocks.each do |ticker_sym, stock|
			    		puts "    		#{ticker_sym.to_s}: #{stock.shares} shares: $#{get_market_value(ticker_sym.to_s, stock.shares)}"
				end
			end
		end
		true
	end


	#########################################################
      ####################helper functions#########################
      #########################################################

	#returns false if a portfolio doesn't exist
	def portfolio_exists?(port_sym)
		return false if @portfolios[port_sym] == nil
		true
	end

	#returns false if cliend does not have  enough money for specified stocks
	def enough_money?(ticker_string, num_stocks_desired)
		if get_market_value(ticker_string, num_stocks_desired) > @balance 
			return false
		else
			return true
		end
	end

	def enough_stocks?(port_sym, tick_sym, num_stocks_to_sell)
		return false unless  @portfolios[port_sym].has_stocks_in?(tick_sym) &&\
			@portfolios[port_sym].stocks[tick_sym].shares >= num_stocks_to_sell
		true
	end	

	#adds positive float values of money to account
	def add_money(amount)
		return false if amount < 0
		@balance += amount
		true
	end

	#spends amount of specified money if client has enough
	def spend_money(amount)
		return false if @balance < amount
		@balance -= amount
		true
	end

end
