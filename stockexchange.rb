require_relative 'client.rb'
require 'yahoofinance'
include ObjectSpace


alina = Client.new("Alina", 10000000)
##############################################NYC Portfolio
alina.make_new_portfolio("NYC")
goog = alina.buy_stock("GOOG", 10, "NYC")
jnj = alina.buy_stock("JNJ", 10, "NYC")
dis = alina.buy_stock("DIS", 10, "NYC")

alina.sell_stock(goog, 10, "NYC")

alina.sell_stock(jnj, 10, "NYC")
###############################################Hong Kong Portfolio
alina.make_new_portfolio("Hong Kong")
alina.buy_stock("JNJ", 10, "Hong Kong")
alina.buy_stock("C", 10, "Hong Kong")

pavel = Client.new("Pavel", 10000000)

kevin = Client.new("Kevin", 2000000)
kevin.make_new_portfolio("Tech")
kevin.buy_stock("BAC", 20, "Tech")

alex = Client.new("Alex Guzman", 50000000)
alex.make_new_portfolio("impossible")
alex.buy_stock("GOOG", 20000, "impossible")
alex.list_client_portfolios()


eduard = Client.new("Eduard Guzman", 3000000)
eduard.make_new_portfolio("Odessa")
eduard.buy_stock("YHOO", 100, "Odessa")
eduard.list_client_portfolios


alina.list_client_portfolios
kevin.list_client_portfolios

Client.list_all_clients