require_relative 'client'

class Bank
  attr_accessor :clients
  def initialize()
    @clients = {}
  end
  def new_client(name, balance)
    client = Client.new(name, balance)
    clients[name] = client
  end
end