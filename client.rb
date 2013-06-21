require_relative 'bank'

class Client
  attr_accessor :portfolios, :name, :balance
  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  def new_portfolio(name)
    portfolio = Portfolio.new(name)
    portfolios[name] = portfolio
  end
end