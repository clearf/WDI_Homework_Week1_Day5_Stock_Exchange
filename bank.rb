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

  # List all the bank's clients
  def list_clients()
    puts "Client List: "
    @clients.each {|name, client| puts name}
  end

  # For a given client, list all portfolios and their values.
  # Display the total value of all of the client's portfolios
  # and the cash balance left in his account.
  def show_client_report(client)
    current_client = @clients[client.name]
    total_portfolios_value = 0
    puts current_client.name + ": "
    current_client.portfolios.each {|name, portfolio| puts "Portfolio: " + name;
                                    current_portfolio_value = portfolio.get_portfolio_value;
                                    total_portfolios_value += current_portfolio_value;
                                    puts "Value: $" + current_portfolio_value.to_s}
    puts "Total value of all portfolios: " + "$" + sprintf("%.2f", total_portfolios_value).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse
    puts "Balance: " +
    "$" + sprintf("%.2f", current_client.balance).reverse.gsub(%r{([0-9]{3}(?=([0-9])))}, "\\1,").reverse + "\n\n"
  end
end