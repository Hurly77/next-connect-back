class Api::V1::PhotosController < ApplicationController
  
  def update
    @user = User.find_by(id: params[:id])
    if params[:file]
      @user.avatar.attach(params[:file])
      photo = url_for(@user.avatar)
    elsif params[:camera]
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new((Base64.decode64(params[:camera].split(",")))),
        filename: "user.png",
        content_type: "image/png",
      )
      @user.avatar.attach(blob)
      photo = url_for(@user.avatar)
    else
      photo = photo_params[:photo]
    end
    if @user.update(photo_url: photo)
      @user.update_avatar(photo)
      render json: @user 
    end
  end

  
  def show
    binding.pry
    user = User.find_by(id: params[:id])
    render json: user
  end

 private
  def photo_params
    params.require(:photo).permit!
  end
end
