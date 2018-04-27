class Stock < ApplicationRecord
  def self.search_for(ticker)
    stock_quote = StockQuote::Stock.quote(ticker)
    if stock_quote
      new(name: stock_quote.company_name, ticker: stock_quote.symbol, price: stock_quote.latest_price)
    else
      nil
    end
  end
end
