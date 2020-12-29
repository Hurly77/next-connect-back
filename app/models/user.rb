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

  def pending_friends
    requests = self.active_friendships
    r_list = requests.map{|u| u.status === "PENDING" ? User.find_by(id: u.passive_user_id) : []}.flatten
    return r_list
  end

  def requests
    requests = self.passive_friendships
    r_list = requests.map{|r| r.status === "PENDING" ? User.find_by(id: r.active_user_id) : []}.flatten
    return r_list
  end


  def friends
    friends = self.active_friendships
    f_list = friends.map{|f| f.status === "FRIENDS" ? User.find_by(id: f.passive_user_id) : []}.flatten
    return f_list
  end
end
