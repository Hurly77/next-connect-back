class Api::V1::FriendshipsController < ApplicationController

  def friend_request 
    user = User.find_by(params[:active_user_id])
    if !Friendship.requested?(params[:active_user_id], params[:passive_user_id])
      Friendship.find_or_create_by(friends_params)
      render json: {pending_friends: user.pending_friends}
    else
      render json: {pending_friends: user.pending_friends}
    end
  end

  def accept
    user = User.find_by(id: params[:active_user_id])
    binding.pry
    if Friendship.requested?(params[:active_user_id], params[:passive_user_id])
       Friendship.accept_request(params[:active_user_id], params[:passive_user_id])
      render json: {friends: user.friends} 
    else 
      render json: {friends: user.friends}
    end
  end

  private
  def friends_params
    params.require(:friendship).permit(:active_user_id, :passive_user_id, :status)
  end
end
