require_relative 'stock.rb'
require_relative 'portfolio.rb'
require_relative 'client.rb'

class Bank
  attr_accessor :clients

  def initialize
    @clients = []
  end

  def list_clients
    puts "Here's a list of current clients:"
    self.clients.each { |x| puts x.name}
    puts ""
  end

end