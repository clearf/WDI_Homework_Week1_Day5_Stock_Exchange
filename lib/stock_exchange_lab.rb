class Client
  attr_accessor :name, :balance, :portfolio
  def initialize(name)
    @name = name
    @balance = 1
    @portfolio = []
  end
  # def name
  #   @name
  # end
  # def name=(name)
  #   @name = name
  # end


# #This method will return the client's name
#   def client_name
#     return(name)
#   end

end