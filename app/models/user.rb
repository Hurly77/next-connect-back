class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments

  has_many :active_friendships,
           foreign_key: :active_user_id,
           class_name: :Friendship,
           dependent: :destroy

  has_many :passive_friendships,
           foreign_key: :passive_user_id,
           class_name: :Friendship,
           dependent: :destroy

  has_many :active_friends, through: :active_friendships, source: :active_user
  has_many :passive_friends, through: :passive_friendships, source: :passive_user

  def self.query(q)
    User.where("first_name LIKE ?", "%#{q}%")
  end
end
