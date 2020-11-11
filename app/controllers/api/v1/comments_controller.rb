class Api::V1::CommentsController < ApplicationController
  before_action :set_user

  def index
    comments = @post.comments
    render json: comments
  end

  def set_user
    @post = Post.find(params[:post_id])
  end
end
