require 'pry'
require 'yahoofinance'
require_relative 'portfolio.rb'
require_relative 'stock.rb'

class Client
  attr_accessor :name, :cash_bal, :portfolios

  def initialize(name, cash_bal)
    @name = name
    @cash_bal = cash_bal
    @portfolios = {}
  end

  def open_acct(acct_name)
    self.portfolios[acct_name.downcase.split.join("_").to_s] = Portfolio.new(acct_name)
    puts "Succesfully opened an account named \"#{acct_name}\".\n "
  end

  def buy_stock(ticker, num_shares, acct_name)
    key = acct_name.downcase.split.join("_").to_s
    if self.portfolios[key] == nil
      puts "Sorry, the account specified does not exist. Please try this trade again with the correct account name.\n "
    else
      puts "Requested trade is being evaluated..."
    end
    total_tran_value = num_shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    if total_tran_value > self.cash_bal
      puts "Sorry, you do not have enough cash balance to execute this trade.\n "
    else
      self.portfolios[key].add_stock(ticker, num_shares)
      @cash_bal -= total_tran_value
      puts "Requested buy transaction executed.\n "
    end
  end

  def sell_stock(ticker, num_shares, acct_name)
    key = acct_name.downcase.split.join("_").to_s
    if self.portfolios[key] == nil
      puts "Sorry, the account specified does not exist. Please try this trade again with the correct account name.\n "
    else
      puts "Requested trade is being evaluated..."
    end
    total_tran_value = num_shares * YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    if self.portfolios[key].composition[ticker.to_sym].to_i < num_shares.to_i
      puts "Sorry, you do not have enough shares of #{ticker} to executet this trade.\n "
    else
      self.portfolios[key].remove_stock(ticker, num_shares)
      @cash_bal += total_tran_value
      puts "Requested buy transaction executed.\n "
    end
  end

end

