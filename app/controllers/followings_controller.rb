class FollowingsController < BackendController

  def create
    current_user.followings.first_or_create(followed_id: params[:user_id])
    username = User.find(params[:user_id]).username
    redirect_to "/#{username}", notice: "You are now following #{username}"
  end

  def index
  end


  private
  def following_params
    params.require(:following).permit(:followed_id)
  end

end
