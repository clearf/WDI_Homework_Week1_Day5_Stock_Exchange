require 'stock'


describe Stock, "#ticker_value" do
    it "should return 880.93 for one GOOG share" do
        a_stock = Stock.new("GOOG", 1)
        total_value = a_stock.stocks_value
        total_value.should == 880.93
    end

    it "should return 827 for two AAPL stocks" do
        a_stock = Stock.new("AAPL", 2)
        total_value = a_stock.stocks_value
        total_value.should == 827
    end

    # it "should error out" do
    #     a_stock = Stock.new(2, 2)
    #     total_value = a_stock.stocks_value
    #     total_value.should == 0
    # end


    it "should return zero" do
        a_stock = Stock.new("ZZZZVZZT", 2)
        total_value = a_stock.stocks_value
        total_value.should == 0
    end
end
