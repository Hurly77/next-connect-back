class Api::V1::PostsController < ApplicationController
  before_action :set_user

  def index
    render json: @user.posts
  end  
  
    def create
      post = Post.new(post_params)
      if @user.id == params[:user_id] && post.save
        render json: post
      else 
        render json: {error: "Your are not #{@user.first_name}"}
      end
    end
  
    def show
      @post = Post.find(params[:id])
      render json: @post
    end
    
    def update
      post = Post.find(params[:id])
      if @user.id == params[:user_id]
        post.update
      else 
        render json: {error: "Only the creater can edit this post"}
    end
  
    def destroy
      post = Post.find(params[:id])
      post.destroy
    end

    def set_user
      @user = User.find_by(id: params[:user_id])
    end
  
    private
  
    def post_params
      params.require(:post).permit(:user_id, :img, :text)
    end
end
