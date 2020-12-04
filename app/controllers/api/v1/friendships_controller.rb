class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    friends = Friendship.all_friends(user.id)
    pending = Friendship.friends_pending(user.id)
    render json: {user: user, friends: friends, pending: pending}
  end

  def create
    if !Friendship.requested?(params[:active_user_id], params[:passive_user_id])
      friendship = Friendship.create(friends_params)
      render json: pending_friends
    else
      pending = Friendship.friends_pending(params[:active_user_id]) 
      render json: pending
    end
  end

  def destroy
    friendship = Friendship.find_by(passive_user_id: params[:passive_user_id])
    if params[:status] === "DENIED"
      friendship.destroy_all
    end
  end

  private
  def friends_params
    params.require(:friendship).permit(:active_user_id, :passive_user_id, :status)
  end
end
