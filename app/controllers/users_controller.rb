class UsersController < ApplicationController

  def show
    @user = User.find_by_username(params[:id])
    if current_user
      @following = current_user.followings.where(followed_id: @user.id).first_or_initialize
    else
      @following = @user.followings.new
    end
    
    render 'user_not_found' unless @user
    
  end
end
