class FollowingsController < BackendController

  before_filter :find_username, only: [:create, :destroy]

  def create
    current_user.followings.first_or_create(followed_id: params[:user_id])
    redirect_to "/#{@username}", notice: "You are now following #{@username}"
  end

  def index
  end

  def destroy
    @following = current_user.followings.where(id: params[:id]).first
    if @following.destroy
      flash[:notice] = "Unfollowed this user."
    else
      flash[:notice] = "Something went wrong, please try again."
    end
    redirect_to "/#{@username}", notice: "You are now following #{@username}"
  end


  private
  def following_params
    params.require(:following).permit(:followed_id)
  end

  def find_username
    @username = User.find(params[:user_id]).username
  end

end
