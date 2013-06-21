require

class Client

  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance, portfolios=nil)
    @name = name
    @balance = balance
  end


end
