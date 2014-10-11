class TweetsController < BackendController

  def create
    tweet = current_user.tweets.create(tweet_params)
    if tweet.persisted?
      redirect_to [:timeline, :index], notice: 'Your status has been posted.'
    else
      redirect_to [:timeline, :index], notice: 'Status text ' + tweet.errors[:tweet].first
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end
