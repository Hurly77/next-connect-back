class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
    end  
  
    def create
      post = Post.new(post_params)
      if post.save
        render json: post
      else 
        render json: {error: 'Error creating account'}
      end
    end
  
    def show
      post = Post.find(params[:id])
      render json: post
    end
    
    def update
      
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
