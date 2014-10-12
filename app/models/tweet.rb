class Tweet < ActiveRecord::Base
  belongs_to :user
  default_scope { order('created_at DESC') }
  validates :tweet, length: { maximum: 141 }

  def to_s
    tweet
  end

  def self.get_tweet(user)
    Tweet.where("user_id IN (?)", user.followings.pluck(:followed_id) + [user.id]).limit(200)
  end
end
