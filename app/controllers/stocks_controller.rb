class StocksController < ApplicationController
  def search
    @stock = Stock.search_for(params[:stock])
    render 'users/my_portfolio'
  end
end
