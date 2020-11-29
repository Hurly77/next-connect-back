class Api::V1::PostsController < ApplicationController
  include CurrentUserConcern

  def index
    posts = Post.all
    render json: posts.order('id DESC')
  end  
  
    def create
      post = Post.new(post_params)
      if @current_user.id == params[:post][:user_id] && post.save
        render json: post
      else 
        render json: {error: "Your are not #{@current_user.first_name}"}
      end
    end
  
    def show
      post = Post.find(params[:id])
      render json: PostSerializer.new(post)
    end
    
    def update
      post = Post.find(params[:id])
      if @current_user.id == params[:user_id]
        post.update
      else 
        render json: {error: "Only the creater can edit this post"}
      end
    end
  
    def destroy
      post = Post.find(params[:id])
      post.destroy
    end

    private
  
    def post_params
      params.require(:post).permit(:user_id, :img, :text)
    end
end

