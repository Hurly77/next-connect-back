class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_photos
  has_many :likes


  def photos
    PostPhoto.where("post_id = ?", id).pluck(:url)
  end

  def liked(id)
    like = Like.where("post_id = ? AND user_id = ?", self.id, id)
    return like.length > 0
  end
end
