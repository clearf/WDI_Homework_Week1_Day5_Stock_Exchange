require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
# require_relative 'portfolio' # This is unnecessary

clients = []

puts "What is the client name?"
name = gets.chomp
puts "What is their balance?"
balance = gets.chomp

client_1 = Client.new(name, balance) # Makes a new client

puts "#{client_1.name} is a new client, with a balance of $#{client_1.balance}."
clients << client_1

puts "How many portfolios would you like to set up?"
portfolio_num = gets.chomp.to_i

portfolio_num.times do
    puts "What would you like to call the portfolio?"
      portfolio = gets.chomp

    puts "#{client_1.name} creates #{portfolio}."

    client_1.portfolio[:portfolio] = []

    puts "Do you want to buy stocks? (y/n)"
    answer = gets.chomp.downcase

      if answer == "y"
        puts "How many different stocks?"
        answer = gets.chomp.to_i

          answer.times do
            puts "Which stock?"
            s_name = gets.chomp.upcase
            puts "And how many shares?"
            s_shares = gets.chomp.to_i

            stock = Stock.new(s_name, s_shares)

            client_1.portfolio[:portfolio] << stock
          end
      end

    portfolio_value = 0

      client_1.portfolio[:portfolio].each do |stock|
        portfolio_value += stock.value
      end

    puts
    puts "#{portfolio} value is $ #{portfolio_value}"


    puts "Stocks are "

    client_1.portfolio[:portfolio].each do |x|
      puts x.ticker

    end
end


puts
puts "Clients are "

clients.each do |client|
  puts client.name
end