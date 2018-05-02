class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friends << friend if friend
    redirect_to my_portfolio_path
  end

  def destroy
    enemy = User.find(params[:id])
    current_user.friends.delete enemy if enemy
    redirect_to my_portfolio_path
  end
end