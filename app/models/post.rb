class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_photos


  def photos
    PostPhoto.where("post_id = ?", id).pluck(:url)
  end
end
