class Api::V1::PhotosController < ApplicationController
  
  def update
    @user = User.find_by(id: params[:id])
    if params[:file]
      @user.avatar.attach(params[:file])
      photo = url_for(@user.avatar)
    if @user.update(photo_url: photo)
      @user.update_avatar(photo)
      render json: @user.info
    end
  end

  if params[:banner]
    @user.banner.attach(params[:banner])
    photo = url_for(@user.banner)
    if @user.update(banner_url: photo)
      render json: @user
      end
    end
  end

  
  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

 private
  def photo_params
    params.require(:photo).permit!
  end
end
