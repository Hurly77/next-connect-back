class Api::V1::FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(friendships_params)
    if !Friendship.requested?(active_user, passive_user)
      pending_friends = Friendship.friends_pending(active_user),
      friendship.save
      render json: {
        pending_friends: pending_friends
      }

    else
      pending = Friendship.friends_pending(active_user) 
      render json: {pending_friends: pending}
    end
  end

  def update
    if params[:status] == "ACCEPTED"
      status Friendship.accept_request(passive_user, active_user)
      render json: {
        friends: Friendship.all_friends(active_user.id),
      }
    else
      render json: {
        error: "SOMETHING WENT WRONG",
      }
    end
  end

  def destroy
    friendship = Friendship.find_by(passive_user_id: params[:passive_user])
    if params[:status] === "DENIED"
      friendship.destroy_all
    end
  end

  def passive_user
    return User.find_by(id: params[:passive_user_id])
  end

  def active_user
    return User.find_by(id: params[:active_user_id])
  end

  private

  def friendships_params
    params.require(:friendship).permit(:active_user_id, :passive_user_id, :status)
  end
end
