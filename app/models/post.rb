class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_photos


  def make_photos(photos)
        
  end


  def post_urls(photos)
    photos_array = []
    return photos.map do |photo| 
      url = url_for(photo)
    end
  end

end
