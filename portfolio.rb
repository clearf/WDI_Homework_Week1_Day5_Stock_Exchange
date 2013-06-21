class Portfolio
  attr_accessor :stocks, :value
  def initialize (stocks, value)
    @stocks = {}
    @value = value
  end
end