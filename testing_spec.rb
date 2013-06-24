require_relative 'stock'

describe Stock, "#get_price" do
  it "returns a float" do
    stock = Stock.new("AAPL", 1)
    stock.get_price.kind_of? Float
  end
end