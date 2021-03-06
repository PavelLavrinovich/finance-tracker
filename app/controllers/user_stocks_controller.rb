class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    unless stock
      stock = Stock.search_for(params[:stock_ticker])
      stock.save
    end
    UserStock.create(user: current_user, stock: stock)
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    UserStock.where(user: current_user, stock: stock).first.destroy
    redirect_to my_portfolio_path
  end
end