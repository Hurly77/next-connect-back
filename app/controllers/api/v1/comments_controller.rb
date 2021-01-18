class Api::V1::CommentsController < ApplicationController
  def index
  end

  def create
    Comment.create(comment_params)
    post = Post.find_by(id: params[:comment][:post_id])
    render json: {post: post, photos: post.photos, comments: post.comments}
  end

  private 
  
  def comment_params
    params.require(:comment).permit(
      :post_id, 
      :user_id, 
      :users_avatar, 
      :users_full_name, 
      :text)
  end
end
