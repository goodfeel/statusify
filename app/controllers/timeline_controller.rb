class TimelineController < BackendController
  before_filter :get_status, only: :index
  def index

  end

  private
  def get_status
    @statuses = Tweet.where("user_id IN ?", current_user.followings.pluck(:id) + [current_user.id]).limit(200)
  end
end
