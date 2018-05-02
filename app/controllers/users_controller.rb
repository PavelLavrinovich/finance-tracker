class UsersController < ApplicationController
  def my_portfolio

  end

  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.search(params[:search_param])
    render partial: 'friends/result'
  end
end
