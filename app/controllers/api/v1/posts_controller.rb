class Api::V1::PostsController < ApplicationController
  include CurrentUserConcern

  def index
    user = User.find_by(id: params[:id])
    render json: user.posts
  end

  def friends
    user = User.find_by(id: params[:user_id])
    render json: user.friend_posts
  end

  def all_posts
    user = User.find_by(id: params[:user_id])
    render json: user.all_posts.sort.reverse
  end

  def create
    post = Post.new(post_params)
    if @current_user.id == params[:post][:user_id] && post.save
      render json: post
    else
      render json: { error: "Your are not #{@current_user.first_name}" }
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
    params.require(:post).permit(:user_id, :users_full_name, :users_avatar, :img, :text)
  end
end
