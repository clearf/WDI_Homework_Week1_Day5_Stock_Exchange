class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name, balance)
    @name = name
    @balance = balance.to_f
    @portfolio = {}
  end
end
