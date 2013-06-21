require 'pry'
require 'yahoofinance'

class Client
  attr_accessor :name, :balance
  def initialize(name, balance = 0)
    @name = name
    @balance = balance
  end

  def to_s
    return "#{@name} just created a new account with #{@balance} dollars."
  end
end

c1 = Client.new("Sarah", 20)
c2 = Client.new("David", 1000)

puts c1
puts c2


class Firm
  attr_accessor :clients
  def initialize
    @clients = []
  end

  def to_s
    return "A total of #{@clients.count} client(s) have active accounts."
  end
end

jpmorgan = Firm.new
jpmorgan.clients << Client.new("Sarah", 20)
jpmorgan.clients << Client.new("David", 1000)
puts jpmorgan

