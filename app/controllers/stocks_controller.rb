class StocksController < ApplicationController
  def search
    @stock = Stock.search_for(params[:stock])
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
