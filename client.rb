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

    ticker_array = []
    @portfolio[port.to_sym].each { |stock| ticker_array << stock.ticker }

    # check current balance
    if @balance < stock_value
      puts "BUY FAIL: #{name} tries to purchase #{share} shares of #{ticker} but balance is too low, order is canceled.\n\n"
    else
      if ticker_array.include?(ticker) # check if the stock already exists in users portfolio
        find_index = ticker_array.index(ticker)
        show_existing_share = @portfolio[port.to_sym][find_index].share
        @portfolio[port.to_sym][find_index].share += share
      else
        new_stock = Stock.new(ticker, market_price, share)
        @portfolio[port.to_sym] << new_stock
      end
        @balance -= stock_value.to_i
        puts "BUY: #{name} has purchased #{share} shares of #{ticker} for a total value of $#{stock_value}.\nBalance is now $#{@balance}.\n\n"
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
          puts "SELL: #{name} has sold #{share} shares of #{ticker} for a total value of $#{stock_value}.\nBalance is now $#{@balance}.\n\n"
      elsif share == show_existing_share
        @balance += stock_value.to_i
        @portfolio[port.to_sym].delete_at(find_index)
        puts "SELL: #{name} has sold #{share} shares of #{ticker} for a total value of $#{stock_value}.\nBalance is now $#{@balance}.\n\n"
      else
        puts "SELL FAIL: #{name} cannot sell more shares than current holding.\n\n"
      end
    else
      puts "#{name} does not own this stock!\n\n"
    end
  end

  def list_portfolio()
    puts "#{name} currently has #{@portfolio.length} portfolios: "

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
        puts "#{key}: $#{total_stock_value[0]}"
      else
        puts "#{key}: Empty, buy some stocks now!"
      end

    end
    puts "\n"
  end

  def list_stock(port)
    if @portfolio[port.to_sym].any?
      puts "#{name}'s portfolio " + port.upcase + " currently has: "
      @portfolio[port.to_sym].each do |stock|
        puts "#{stock.ticker} - #{stock.share} shares - Current Price: $#{stock.market_price} "
      end
      puts "\n"
    end
  end

  def self.list_all
    print "The current clients are: "
    ObjectSpace.each_object(self) { |client| print "#{client.name} " }
    puts "\n\n"
  end
end