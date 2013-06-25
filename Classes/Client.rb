
require_relative 'portfolio'
require_relative 'trade'
require_relative 'stock'

class Brokerage #Acts as a "shelter" for the clients; could be replaced by the ability to list clients separately
  attr_accessor :client_list

  def initialize()
    @client_list = []
  end

  def add_client(client)
    @client_list << client
  end

  def list_clients
    @client_list.each {|client| puts client}
  end
end

class Client
  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  def to_s
      "#{@name}, who has an uninvested cash balance of #{@balance} dollars and has #{@portfolios.count} investment portfolios."
  end
end

