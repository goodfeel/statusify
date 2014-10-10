class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :followings

  def to_s
    "@#{username}"
  end

  def followers
    Following.where(followed_id: self.id)
  end

  
end
