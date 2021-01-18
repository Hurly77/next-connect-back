class Api::V1::PostsController < ApplicationController
  include CurrentUserConcern

  def index
    user = User.find_by(id: params[:id])
    render json: user.user_posts
  end

  def friends
    user = User.find_by(id: params[:user_id])
    render json: user.friend_posts
  end

  def all_posts
    user = User.find_by(id: params[:user_id])
    render json: user.all_posts
  end

  def create
    post = Post.new(post_params)
    if post.save 
      render json: {post: post}
    else
      render json: {message: "Something went wrong"}
    end
  end

  def update
    post = Post.find(params[:id])
    if @current_user.id == params[:user_id]
      post.update
    else
      render json: { error: "Only the creater can edit this post" }
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private
  def post_params
    params.require(:post).permit!
  end
 
end
