require 'yahoofinance'
require_relative 'portfolio.rb'
require_relative 'stock.rb'


class Client
  attr_accessor :name, :cash_bal, :portfolios

  def initialize(name, cash_bal)
    @name = name
    @cash_bal = cash_bal
    @portfolios = []
  end

  def open_acct(acct_name)
    self.portfolios << Portfolio.new(acct_name)
    puts "Succesfully opened an account named \"#{acct_name}\"."
  end

  def buy_stock(ticker, num_shares, port_name)
    puts "Requested trade is being evaluated..."
    total_tran_value = num_shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    if total_tran_value > self.cash_bal
      puts "Sorry, you do not have enough cash balance to execute this trade."
    else
      port_name.add_stock(ticker, num_shares)
      @cash_bal -= total_tran_value
      puts "Requested buy transaction executed."
    end
  end

  def sell_stock(ticker, num_shares, port_name)
    puts "Requested trade is being evaluated..."
    total_tran_value = num_shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    if port_name.composition[ticker.to_sym] < num_shares
      puts "Sorry, you do not have enough shares of #{ticker} to executet this trade."
    else
      port_name.remove_stock(ticker, num_shares)
      @cash_bal += total_tran_value
    end
  end

end

