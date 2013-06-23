require_relative 'client'

class Bank
  attr_accessor :clients

  def initialize()
    @clients = {}
  end

# Create a new client with a name and a balance
# and add it to the client list.
  def new_client(name, balance)
    client = Client.new(name, balance)
    clients[name] = client
    return client
  end

  def list_clients()
    puts "Client List: "
    @clients.each {|name, client| puts name}
  end

  def show_client_report(client)
    current_client = @clients[client]
    total_portfolios_value = 0
    puts current_client.name + ": "
    current_client.portfolios.each {|name, portfolio| puts "Portfolio: " + name;
                                    current_portfolio_value = portfolio.get_portfolio_value;
                                    total_portfolios_value += current_portfolio_value;
                                    puts "Value: " + current_portfolio_value.to_s}
    puts "Total value of all portfolios: #{total_portfolios_value}"
    puts "Balance: " + current_client.balance.to_s
  end
end