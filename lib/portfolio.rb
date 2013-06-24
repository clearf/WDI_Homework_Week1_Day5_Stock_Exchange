require 'pry'
require_relative 'stock.rb'

class Portfolio
  attr_accessor :port_name, :inv_count, :portfolio_bal, :composition

  def initialize (port_name, inv_count = 0, portfolio_bal = 0)
    @port_name = port_name
    @inv_count = inv_count
    @portfolio_bal = portfolio_bal
    @composition = {} # Hash to contain: ticker and # of shares
  end

  def add_stock(ticker, shares_bought)
    @inv_count += 1
    @composition[ticker.to_sym] = shares_bought
    puts "#{shares_bought} of #{ticker} has been added to your portfolio named \"#{@port_name}\"."
    self.calc_port_bal
  end

  def remove_stock(ticker, shares_sold)
    check_shares = self.composition[ticker.to_sym].to_i
    if shares_sold == check_shares
      @inv_count -= 1
      @composition.delete(ticker.to_sym)
    else
      new_shares = check_shares - shares_sold
      self.composition[ticker.to_sym] = new_shares
    end
    puts "#{shares_sold} of #{ticker} has been removed from your portfolio named \"#{@port_name}\"."
    self.calc_port_bal
  end

  def calc_port_bal
    running_bal = 0
    self.composition.each do |x, y|
      running_bal += Stock.get_price(x.to_s) * y
    end
    @portfolio_bal = running_bal
    puts "Current value of #{@port_name} is #{@portfolio_bal}."
  end
end

