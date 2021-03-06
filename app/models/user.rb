# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :marks
  has_many :mark_drafts
  has_many :favorites
  has_many :comments
  has_many :clips

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # フォローする人取得
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy # フォローされる人取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  # ユーザーをフォローする、後ほどcontrollerで使用します。
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す、後ほどcontrollerで使用します。
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す、後ほどviewで使用します。
  def following?(user)
    following_user.include?(user)
  end
end
