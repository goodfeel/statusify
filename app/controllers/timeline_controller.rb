class TimelineController < BackendController
  before_filter :get_status, only: :index
  def index
    @tweet = current_user.tweets.new
  end

  private
  def get_status
    @tweets = Tweet.where("user_id = ?", current_user.followings.pluck(:id) + [current_user.id]).limit(200)
  end
end
