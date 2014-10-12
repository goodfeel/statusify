class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:id])
    @following = @user.followings.new
    render 'user_not_found' unless @user
    
  end
end
