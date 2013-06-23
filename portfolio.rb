class Portfolio
  attr_accessor :port_name, :stock

  def initialize(port_name)
    @port_name = port_name
    @stock = []
  end
end