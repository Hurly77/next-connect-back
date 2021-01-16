class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :post_photos
  has_many :comments
  has_one_attached :avatar
  has_one_attached :banner


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

  def self.find_user_by_c_id(id)
    user = User.where("c_id LIKE ?", id).limit(1)
    return user
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

  def friend_posts
    self.friends.map{|friend| Post.all.where("user_id = ?", friend.id).order("id DESC")}.flatten
  end

  def photo_array(id)
    return PostPhoto.where("post_id = ?", id).pluck(:url)
  end

  def user_posts
    my_posts = self.posts.reverse.map do |p|
      obj = {
        post: p,
        photos: photo_array(p.id)
      }
    end
    return my_posts
  end

  def all_posts
    user_posts = self.posts.clone
    friend_posts = self.friend_posts.clone
    all_posts = friend_posts.concat(user_posts)
    my_posts = all_posts.reverse.map do |p|
      obj = {
        post: p,
        photos: photo_array(p.id)
      }
    end

    return my_posts
  end

  def photos
    self.post_photos.pluck(:url)
  end

  def update_avatar(url)
    binding.pry
    Post.where("user_id = ?", self.id).update_all(users_avatar: url)
  end
end
