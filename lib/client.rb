
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
	def buy_stocks(portfolio_name, tick_string, num_stocks)
		portfolio_sym = portfolio_name.to_sym
		return false unless enough_money?(tick_string, num_stocks) && portfolio_exists?(portfolio_sym)
		@portfolios[portfolio_sym].add_stock(tick_string, num_stocks)
		spend_money(num_stocks * get_ticker(tick_string))
		puts "	#{@name} just bought #{num_stocks} shares in #{tick_string}"
	end

	def sell_stocks(portfolio_name, tick_string, num_stocks)
		portfolio_sym = portfolio_name.to_sym
		tick_sym = tick_string.to_sym
		return false unless portfolio_exists?(portfolio_sym) && enough_stocks?(portfolio_sym, tick_sym, num_stocks)
		@portfolios[portfolio_sym].remove_stock(tick_sym, num_stocks)
		@balance += num_stocks * get_ticker(tick_string) 
		puts "	#{@name} just sold #{num_stocks} of his/her shares in #{tick_string}"
	end

	#creates a new portfolio
	def new_portfolio(portfolio_name)
		return false if portfolio_name.class != String #returns false if 
		portfolio_sym = portfolio_name.to_sym
		return false if portfolio_exists?(portfolio_sym) #return false if portfolio exists alread
		@portfolios[portfolio_sym] = Portfolio.new #otherwise creates new portfolio
		return true
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
			    		puts "    		#{ticker_sym.to_s}: #{stock.shares} shares: $#{stock.stocks_value}"
				end
			end
		end
		return true
	end


	#########################################################
      ####################helper functions#########################
      #########################################################

	def get_ticker (ticker_string)
		return YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker_string)[ticker_string].lastTrade
	end

		#returns false if a portfolio doesn't exist
	def portfolio_exists?(portfolio_sym)
		return false if @portfolios[portfolio_sym] == nil
		return true
	end

	#returns false if cliend does not have  enough money for specified stocks
	def enough_money?(ticker_string, num_stocks_desired)
		if num_stocks_desired * get_ticker(ticker_string) > @balance 
			puts "You don't have enough money to do that, that costs #{num_stocks_desired * get_ticker(ticker_string)}, and you have #{balance}"
			return false
		end
		return true
	end

	def enough_stocks?(portfolio_sym, tick_sym, num_stocks_to_sell)
		return false unless  @portfolios[portfolio_sym].has_stocks_in?(tick_sym) &&\
			@portfolios[portfolio_sym].stocks[tick_sym].shares >= num_stocks_to_sell
		return true
	end	

	#adds positive float values of money to account
	def add_money(amount)
		return false if amount < 0
		@balance += amount
		return true
	end

	#spends amount of specified money if client has enough
	def spend_money(amount)
		return false if @balance < amount
		@balance -= amount
		true
	end

end
