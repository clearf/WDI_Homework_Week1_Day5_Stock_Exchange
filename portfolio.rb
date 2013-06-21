class Portfolio
  attr_accessor :stocks, :name
  def initialize(name)
    @name = name
    @stocks = {}
  end
end