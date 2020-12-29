class Api::V1::UsersController < ApplicationController
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
      )
      user.save
  end

  def show
    user = User.find_by(id: params[:id])
    render json: {
      friends: user.friends,
      pending_friends: user.pending_friends,
      requests: user.requests
    }
  end

  def destroy
    user = User.find_by(id: params[:active_user_id])
    friendship = Friendship.find_by(active_user_id: params[:passive_user_id], passive_user_id: params[:active_user_id])
    friendship.destroy
    render json: {pending_friends: user.pending_friends}
  end
end