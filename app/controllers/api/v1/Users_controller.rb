class Api::V1::UsersController < ApplicationController
  def index
    users = User.query(params[:query])
    if users
    render json: {tree: users}
    else 
      render json: {status: 'not success'}
    end
  end

  def show
    render json: {
      friends: Friendship.all_friends(params[:id]),
      pending_friends: Friendship.friends_pending(params[:id])
    }
  end
end