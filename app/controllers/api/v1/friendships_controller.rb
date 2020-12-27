class Api::V1::FriendshipsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    friends = Friendship.all_friends(user.id)
    pending = Friendship.friends_pending(user.id)
    render json: {user: user, friends: friends, pending: pending}
  end


  def friend_request 
    if !Friendship.requested?(params[:active_user_id], params[:passive_user_id])
      friendship = Friendship.create(friends_params)
      render json: {
        friends: Friendship.all_friends(params[:active_user_id]),
        pending_friends: Friendship.friends_pending(params[:active_user_id]),
        requests: User.requests(params[:active_user_id])
      }
    else
      render json: {
        friends: Friendship.all_friends(params[:id]),
        pending_friends: Friendship.friends_pending(params[:id]),
        requests: User.requests(params[:active_user_id])
      }
    end
  end

  def accept
    if Friendship.requested?(params[:passive_user_id], params[:active_user_id])
  end

  def create
   
  end


  def update
    if Friendship.requested?(params[:active_user_id], params[:passive_user_id])
      friendship = Friendship.create(friends_params)
      render json: {
        friends: Friendship.all_friends(params[:id]),
        pending_friends: Friendship.friends_pending(params[:id]),
        requests: User.requests(params[:active_user_id])
      }
    else
      render json: {
        friends: Friendship.all_friends(params[:id]),
        pending_friends: Friendship.friends_pending(params[:id]),
        requests: user.passive_friendships
      }
    end
  end

  private
  def friends_params
    params.require(:friendship).permit(:active_user_id, :passive_user_id, :status)
  end
end
