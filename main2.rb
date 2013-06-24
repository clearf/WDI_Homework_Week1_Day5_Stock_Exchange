require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
require_relative 'portfolio'

clients = []

puts "What is the client name?"
name = gets.chomp
puts "What is their balance?"
balance = gets.chomp

client_1 = Client.new(name, balance)

puts "#{client_1.name} is a new client, with a balance of #{client_1.balance}"
clients << client_1

puts "#{client_1.name} how many portfolios would you like to set up?"
portfolio_num = gets.chomp.to_i

case portfolio_num
  when 0
    puts "Ok"
  when 1
    puts "What would you like to call it?"
      portfolio1 = gets.chomp

    puts "#{client_1.name} creates #{portfolio1}."
    client_1.portfolio[:portfolio1] = []

    puts "Would you like to buy more stock for #{portfolio1} today? (y/n)"
    answer = gets.chomp.to_s.downcase
    if answer == "y"
      puts "How many different stocks?"
      number_of_tickers = gets.chomp.to_i

      number_of_tickers.times do

      puts "Name a stock."
      stock_name = gets.chomp.upcase
      puts "How many shares would you like to buy?"
      stock_shares = gets.chomp.to_i

      stock = Stock.new(stock_name, stock_shares)

      client_1.portfolio[:portfolio1] << stock
    end
      portfolio1_value = 0

      client_1.portfolio[:portfolio1].each do |stock|
        portfolio1_value += stock.value
      end

      total_value = portfolio1_value

  total_balance = (client_1.balance - total_value.to_f)
  puts "Your portfolio now features #{stock_shares} shares of #{stock_name}. You own #{stock.value} of stock."
  puts "#{portfolio1} now has a value of #{portfolio1_value}"
  puts "Your portfolio balance is now #{total_balance}"




  else
  puts "Ok, maybe another time."
end
when 2
  puts "What would you like to call the first one?"
    portfolio1 = gets.chomp
  puts "What would you like to call the second one?"
  portfolio2 = gets.chomp
  puts "#{client_1.name} creates #{portfolio1} and #{portfolio2}."
  client_1.portfolio[:portfolio1] = []
  client_1.portfolio[:portfolio2] = []



  else
  puts "too many!"
end

total_value = 0
portfolio1_value = 0
portfolio2_value = 0



ben.portfolio[:portfolio2].each do |stock|
  portfolio2_value += stock.value
end

total_value = portfolio1_value #+ portfolio2_value


puts total_value



puts "Portfolio 1 value is $ #{portfolio1_value}"
puts "Portfolio 2 value is $ #{portfolio2_value}"
puts "The total value is #{total_value}"
puts "Balance is $#{total_balance}."

puts
puts "Portfolio 1 stocks are"

ben.portfolio[:portfolio1].each do |stock|
  puts stock.ticker
end

puts "Portfolio 2 stocks are"

ben.portfolio[:portfolio2].each do |stock|
  puts stock.ticker
end

puts
puts "Clients are"

clients.each do |client|
  puts client.name
end


# ben.portfolio

# ben.portfolio[:stock1] = Stock.new("AAPL",10)
# ben.portfolio[:stock2] = Stock.new("JMBA",10)

# puts ben.portfolio[:stock1].value


# puts ben.portfolio[:stock1].price
# puts ben.portfolio[:stock2].price