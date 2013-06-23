class Client
  attr_accessor :name, :balance, :portfolio

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolio = {}
  end

  def create_portfolio(port_name)
    # new_portfolio = Portfolio.new(port_name)  # dont even need to create port object
    portfolio[port_name.to_sym] = [] # push portfolio into portfolio hash
  end

  def buy_stock(ticker, share, port)
    market_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    stock_value = market_price * share

    # check current balance
    if @balance < stock_value
      puts "BUY FAIL: You try to purchase #{share} shares of #{ticker} but your balance is too low, order is canceled.\n\n"
    else
      new_stock = Stock.new(ticker, market_price, share)
      @portfolio[port.to_sym] << new_stock
      @balance -= stock_value.to_i
      puts "BUY: Your have purchased #{share} shares of #{ticker} for a total value of $#{stock_value}.\nYour new balance is now $#{@balance}.\n\n"
    end
  end

  def sell_stock(ticker, share, port)
    market_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, ticker)[ticker].lastTrade
    stock_value = market_price * share

    # check if the stock actually exists in users portfolio
    # if yes, find associated share amount by index of array
    ticker_array = []
    @portfolio[port.to_sym].each { |stock| ticker_array << stock.ticker }

    if ticker_array.include?(ticker)
      find_index = ticker_array.index(ticker)
      show_existing_share = @portfolio[port.to_sym][find_index].share

      if share < show_existing_share
        @balance += stock_value.to_i
        @portfolio[port.to_sym][find_index].share -= share
          puts "SELL: You have sold #{share} shares of #{ticker} for a total value of $#{stock_value}.\nYour new balance is now $#{@balance}.\n\n"
      elsif share == show_existing_share
        @balance += stock_value.to_i
        @portfolio[port.to_sym].delete_at(find_index)
        puts "SELL: You have sold #{share} shares of #{ticker} for a total value of $#{stock_value}.\nYour new balance is now $#{@balance}.\n\n"
      else
        puts "SELL FAIL: You cannot sell more shares than your current holding.\n\n"
      end
    else
      puts "You do not own this stock!\n\n"
    end
  end

  def list_portfolio()
    puts "You currently have #{@portfolio.length} portfolios: "

    @portfolio.each do |key, port|
      total_stock_value = []
      port.each do |stock|
        each_stock_value = stock.share * stock.market_price
        total_stock_value << each_stock_value
      end

      key = key.upcase

      if total_stock_value.length > 1
        total_stock_value.inject do |sum, x|
          addup = sum + x
          puts "#{key}: $#{addup}"
        end
      elsif total_stock_value.length == 1
        puts total_stock_value
      else
        puts "#{key}: This is an empty portfolio, buy some stocks now!"
      end

    end
    puts "\n"
  end

  def list_stock(port)
    puts "Your portfolio " + port.upcase + " currently has: "
    @portfolio[port.to_sym].each do |stock|
      puts "#{stock.ticker} - #{stock.share} shares - $#{stock.market_price} "
    end
    puts "\n"
  end

  def self.list_all
    print "The current clients are: "
    ObjectSpace.each_object(self) { |client| print "#{client.name} " }
    puts "\n\n"
  end
end