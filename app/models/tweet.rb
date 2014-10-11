class Tweet < ActiveRecord::Base
  belongs_to :user
  default_scope { order('created_at DESC') }
  validates :tweet, length: { maximum: 141 }

  def to_s
    tweet
  end
end
