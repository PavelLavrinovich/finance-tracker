class Stock < ApplicationRecord
  def self.search_for(ticker)
    stock_quote = StockQuote::Stock.quote(ticker)
    new(name: stock_quote.company_name, ticker: stock_quote.symbol, price: stock_quote.latest_price) if stock_quote
  end
end
