module FollowingsHelper

  def able_to_follow?(user)
    if current_user != user
      if current_user.followings.where(followed_id: user.id).first.nil?
        return true
      end
    end
    false
  end

  def able_to_unfollow?(user)
    if current_user.followings.where(followed_id: user.id).first.present?
      true
    else
      false
    end
  end
end
