class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    unless stock
      stock = Stock.search_for(params[:stock_ticker])
      stock.save
    end
    UserStocks.create(user: params[:user], stock: params[:stock_ticker])
    redirect_to my_portfolio_path
  end
end