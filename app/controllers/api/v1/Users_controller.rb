class Api::V1::UsersController < ApplicationController
  include CurrentUserConcern


  def index
    users = User.query(params[:query])
    if users
    render json: {tree: users}
    else 
      render json: {status: 'not success'}
    end
  end

  def update
      user = User.find_by(id: params[:user][:id])
      user.update(
        first_name: params[:user][:first_name], 
        last_name: params[:user][:last_name], 
        email: params[:user][:email], 
        avatar: params[:user][:avatar], 
        work: params[:user][:work],
        education: params[:user][:education],
        relationship: params[:user][:relationship],
        lives: params[:user][:lives],
        from: params[:user][:from],
        joined: params[:user][:joined],
      )
  end

  def show
    render json: {
      friends: Friendship.all_friends(params[:id]),
      pending_friends: Friendship.friends_pending(params[:id])
    }
  end
end