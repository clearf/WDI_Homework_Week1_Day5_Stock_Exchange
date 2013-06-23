require 'yahoofinance'
require_relative 'client'
require_relative 'stock'
# require_relative 'portfolio'

clients = []

puts "What is the client name?"
name = gets.chomp
puts "What is their balance?"
balance = gets.chomp

client_1 = Client.new(name, balance)

# ben=Client.new("Ben", 100000)
puts "#{client_1.name} is a new client, with a balance of $#{client_1.balance}."
clients << client_1

puts "How many portfolios would you like to set up?"
portfolio_num = gets.chomp.to_i

# # case portfolio_num
# #   when 0
# #     puts "OK"
# #   when 1

# portfolio_num.times do
#     puts "What would you like to call it?"
#       portfolio1 = gets.chomp

#     puts "#{client_1.name} creates #{portfolio1}."

#     client_1.portfolio[:portfolio1] = []

#     puts "Do you want to buy stocks? (y/n)"
#     answer = gets.chomp.downcase

#     if answer == "y"
#       puts "How many different stocks?"
#         answer = gets.chomp.to_i

#       answer.times do
#           puts "Which stock?"
#           s1_name = gets.chomp.upcase
#           puts "And how many shares?"
#           s1_shares = gets.chomp.to_i

#         stock = Stock.new(s1_name, s1_shares)

#         client_1.portfolio[:portfolio1] << stock
#         end
#     # else
#     #   puts "OK"
#     end

#     # s1 = Stock.new(s1_name, s1_shares)
#     # client_1.portfolio[:portfolio1] = [s1]
#     portfolio1_value = 0

#     client_1.portfolio[:portfolio1].each do |stock|
#       portfolio1_value += stock.value
#     end

#     total_value = portfolio1_value # + portfolio2_value

#     puts
#     puts "#{portfolio1} value is $ #{portfolio1_value}"
#     # puts "Portfolio 2 value is $ #{portfolio2_value}"
#     puts "The total value is $#{total_value}"

#     total_balance = (client_1.balance - total_value.to_f)

#     puts "Balance is $#{total_balance}."

#   when 2
#     puts "What would you like to call the first one?"
#       portfolio1 = gets.chomp
#     puts "What would you like to call the second one?"
#       portfolio2 = gets.chomp

#   puts "#{client_1.name} creates #{portfolio1} and #{portfolio2}."
#   client_1.portfolio[:portfolio1] = []
#   client_1.portfolio[:portfolio2] = []

#   else
#     puts "Too many!"
# end





portfolio_num.times do
    puts "What would you like to call the portfolio?"
      portfolio1 = gets.chomp

    puts "#{client_1.name} creates #{portfolio1}."

    client_1.portfolio[:portfolio1] = []

    puts "Do you want to buy stocks? (y/n)"
    answer = gets.chomp.downcase

      if answer == "y"
        puts "How many different stocks?"
        answer = gets.chomp.to_i

          answer.times do
            puts "Which stock?"
            s1_name = gets.chomp.upcase
            puts "And how many shares?"
            s1_shares = gets.chomp.to_i

            stock = Stock.new(s1_name, s1_shares)

            client_1.portfolio[:portfolio1] << stock
          end
      end

    portfolio1_value = 0

      client_1.portfolio[:portfolio1].each do |stock|
        portfolio1_value += stock.value
      end

    puts
    puts "#{portfolio1} value is $ #{portfolio1_value}"


    puts "Stocks are "

    client_1.portfolio[:portfolio1].each do |x|
      puts x.ticker
    end
end
    # puts "The total value is $#{total_value}"

    # total_balance = (client_1.balance - total_value.to_f)

    # puts "Balance is $#{total_balance}."

















# puts "#{ben.name} buys 100 shares of AAPL and 100 shares of JMBA for Portfolio 1."
# s1 = Stock.new("AAPL", 100)
# s2 = Stock.new("jmba", 100)

# puts "#{ben.name} buys 100 shares of C and 100 shares of NFLX for Portfolio 2."
# s3 = Stock.new("C", 100)
# s4 = Stock.new("nflx", 100)

# client_1.portfolio[:portfolio2] = [s3, s4]

# puts ben.portfolio

# total_value = 0

# portfolio2_value = 0




# ben.portfolio[:portfolio2].each do |stock|
#   portfolio2_value += stock.value
# end






# ben.portfolio.each do |x|
#   puts x.ticker
# end

# puts
# puts "Portfolio 1 stocks are "

# client_1.portfolio[:portfolio1].each do |stock|
#   puts stock.ticker
# end

puts
# puts "Portfolio 2 stocks are "

# client_1.portfolio[:portfolio2].each do |stock|
#   puts stock.ticker
# end

# puts ben.portfolio[:portfolio1][0].ticker

puts
puts "Clients are "

clients.each do |client|
  puts client.name
end



# ben.portfolio

# ben.portfolio[:stock1] = Stock.new("AAPL",10)
# ben.portfolio[:stock2] = Stock.new("JMBA",10)

# puts ben.portfolio[:stock1].value


# puts ben.portfolio[:stock1].price
# puts ben.portfolio[:stock2].price