require	'yahoofinance'


def get_price(ticker)
	return YahooFinance::get_quotes(YahooFinance::StandardQuote, 
		ticker)[ticker].lastTrade
end	

puts get_price('AAPL')