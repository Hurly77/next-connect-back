class Api::V1::LikesController < ApplicationController
  before_action :set_post, only [:create, :destroy]

  def create
    if !@post.liked?
      render json: {return true}
    else
      render json: {}
    end
  end

  def destroy
    
  end


  def set_post 
    @post = Post.find_by(id: params[:like][:post_id])

    @user = User.find_by(id: params[:like][:user_id])
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
