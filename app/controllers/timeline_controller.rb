class TimelineController < BackendController
  before_filter :get_status, only: :index
  def index
    @tweet = current_user.tweets.new
  end

  private
  def get_status
    @tweets = Tweet.get_tweet(current_user)
  end
end
