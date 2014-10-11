class TweetsController < BackendController

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.persisted?
      redirect_to [:timeline, :index], notice: 'Your status has been posted.'
    else
      redirect_to [:timeline, :index], notice: 'Status text ' + tweet.errors[:tweet].first
    end
  end

  def destroy
    tweet = current_user.tweets.find(params[:id])
    if tweet.destroy
      redirect_to [:timeline, :index], notice: 'Status has been deleted.'
    else
      flash[:error] = "Something went wrong."
      redirect_to [:timeline, :index]
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
