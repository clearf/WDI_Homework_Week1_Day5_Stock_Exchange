class Client
  attr_accessor :name, :balance, :portfolios, :portfolios_total_value

  def initialize(name, balance, portfolios={})
    @name = name
    @balance = balance
    @portfolios = portfolios
  end
end
