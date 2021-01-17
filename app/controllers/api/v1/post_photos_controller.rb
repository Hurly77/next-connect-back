class Api::V1::PostPhotosController < ApplicationController
  def show
    user = User.find_by(id: params[:id])
    render json: user.photos
  end


  def create
    user = User.find_by(id: params[:user_id].to_i)
   if params[:photos]
    photos = params[:photos]
    user_id = params[:user_id].to_i
    post_id = params[:post_id].to_i
    post_photos = photos.map do |photo|
      puts "success"
      new_photo = PostPhoto.new(user_id: user_id, post_id: post_id, url: nil)
      new_photo.save
      new_photo.photo.attach(photo)
      url = url_for(new_photo.photo)
      new_photo.update(url: url)
      new_photo.save
    end
    render json: {posts: user.all_posts}
  end
  end

end
