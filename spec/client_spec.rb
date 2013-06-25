require 'client'

describe Client, "#initialize" do
    it "should have a bit of money added on initialization" do    
        c = Client.new("Billy", 30000)
        balance = c.balance
        balance.should == 30000
    end

    #if use puts in a string as a balance, their account ballance is zero
    it "should set balance to zero unless number is input" do
        c = Client.new("Billy", "Dog")
        balance = c.balance
        balance.should == 0
    end
end

describe Client, "#new_portfolio" do
	it "should allow clients to make multiple portfolios" do
		c = Client.new("Bob", 10000)
		c.new_portfolio("p_one")
		c.new_portfolio("p_two")
		c.new_portfolio("p_three")
		result = c.portfolio_exists?(:p_one)
		result = result || c.portfolio_exists?(:p_two)
		result = result || c.portfolio_exists?(:p_three)
		result.should == true
	end

	it "should not overwrite portfolios if they are 'new'ed again" do
		c = Client.new("Billy", 100000)
		c.new_portfolio("p_one")
		c.buy_stocks("p_one", "GOOG", 2)
		c.buy_stocks("p_one", "MSFT", 2)
		c.buy_stocks("p_one", "AAPL", 6)
		c.new_portfolio("p_one")	
		c.portfolios[:p_one].has_stocks_in?(:GOOG).should == true	
	end

	it "should return false if input is not a string" do
		c = Client.new("Billy", 100000)
		c.new_portfolio(12).should == false
	end
		

end

describe Client, "#buy_stocks" do
	it "should allow client with sufficient funds to buy stocks" do
		c = Client.new("Billy", 100000)
		c.new_portfolio("p_one")
		c.new_portfolio("p_two")
		c.buy_stocks("p_one", "GOOG", 2)
		c.buy_stocks("p_one", "MSFT", 2)
		c.buy_stocks("p_one", "AAPL", 6)
		c.buy_stocks("p_two", "MCD", 10)
		c.buy_stocks("p_two", "SIRI", 2)
		c.list_all_portfolios
	end

	it "should return false if client attempts to put stocks into non-existing portfolio" do
		c = Client.new("Billy", 100000)
		c.buy_stocks("p_two", "GOOG", 2)
		c.buy_stocks("p_two", "MSFT", 2)
		c.buy_stocks("p_two", "AAPL", 6)
		c.buy_stocks("p_three", "MCD", 10)
		c.buy_stocks("p_three", "SIRI", 2)
		c.balance.should == 100000
	end

	it "should subtract money from client's balance when they buy stock" do
		c = Client.new("Billy", 2000)
		c.new_portfolio("p_one")
		c.buy_stocks("p_one", "GOOG", 2)
		result = c.balance
		result.should == (2000 - 1761.86)
	end

	it "shouldn't let a client buy stocks if he or she doesn't have the funds" do
		c = Client.new("Billy", 0)
		c.new_portfolio("p_one")
		c.buy_stocks("p_one", "GOOG", 2).should == false
	end
end

describe Client, "#sell_stocks" do
	it "should let clients sell stocks if they have enough shares" do
		c = Client.new("Billy", 100000)
		c.new_portfolio("p_one")
		c.buy_stocks("p_one", "GOOG", 2)
		c.buy_stocks("p_one", "MSFT", 2)
		c.buy_stocks("p_one", "AAPL", 6)
		c.buy_stocks("p_one", "MCD", 10)
		c.buy_stocks("p_one", "SIRI", 2)
		c.sell_stocks("p_one", "GOOG", 2)
		c.sell_stocks("p_one", "MSFT", 2)
		c.sell_stocks("p_one", "AAPL", 6)
		c.sell_stocks("p_one", "MCD", 10)
		c.sell_stocks("p_one", "SIRI", 2)
		c.list_all_portfolios
		c.balance.should == 100000
	end

	it "should return false if client has no shares to sell" do
		c = Client.new("Billy", 100000)
		c.new_portfolio("p_one")
		result = c.sell_stocks("p_one", "GOOG", 2)
		result = result || c.sell_stocks("p_one", "MSFT", 2)
		result = result || c.sell_stocks("p_one", "AAPL", 6)
		result = result || c.sell_stocks("p_one", "MCD", 10)
		result = result || c.sell_stocks("p_one", "SIRI", 2)
		result.should == false && c.balance.should == 100000
 	end

 	it "should give clients the current value of their shares" do
 	 	c = Client.new("Barry", 0)
 	 	c.new_portfolio("p_one")
 	 	c.portfolios[:p_one].add_stock("GOOG", 2)
 	 	c.sell_stocks("p_one", "GOOG", 2)
 	 	c.balance.should > 0
 	end
end


describe Client, "#add_money" do
    it "should add money upon function call" do
        c = Client.new("Billy",  30000)
        c.add_money(10000)
        balance = c.balance
        balance.should == 40000
    end
end

describe Client, "#spend_money" do
    it "should subtract money upon function call" do
        c = Client.new("Billy",  30000)
        c.spend_money(10000)
        balance = c.balance
        balance.should == 20000
    end

    it "should not remove more money that the client has (returns false if you try)" do
        c = Client.new("Billy", 30000)
        result = c.spend_money(40000)
        result.should == false
    end
end


describe Client, "#checker_functions" do
	it "should return false if client doesn't have enough money for desired stocks" do
		c = Client.new("Billy", 0)
		c.enough_money?("GOOG", 2).should == false
	end

	it "should return false if client doesn't have enough shares of specified stock in port."  do
		c = Client.new("Billy", 0)
		c.new_portfolio("p_one")
	      c.portfolios[:p_one].add_stock("GOOG", 2)
	      c.portfolios[:p_one].add_stock("AAPL", 5)
	      c.enough_stocks?(:p_one, :GOOG, 1).should == true

	end
end

describe Client, "#buy_stocks" do
	it "should allow a client with sufficient money to buy stocks" do
		c = Client.new("Billy", 1000000)
		c.new_portfolio("my_first_portfolio")
		result = c.buy_stocks("my_first_portfolio", "GOOG", 20)
		result.should == true
	end
end


