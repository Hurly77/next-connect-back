class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :destroy]

  def index
    users = User.query(params[:query])
    if users
    render json: {tree: users}
    else 
    render json: {status: 'not success'}
    end
  end

  def update
    if @user.update_attributes(user_params)
      @user.save
      render json: {user: @user.info}
    else 
      render json: {message: "no user exists"}
    end
end

  def show
    render json: {
      friends: @user.friends,
      pending_friends: @user.pending_friends,
      requests: @user.requests
    }
  end

  def destroy
    friendship = Friendship.find_by(active_user_id: params[:active_user_id], passive_user_id: params[:passive_user_id])
    friendship.destroy
    render json: {pending_friends: @user.pending_friends}
  end

  def existing_user
    if find = User.find_user_by_c_id(params[:c_id])
      render json: find
    end
  end

  def set_user
    if params[:id]
      @user = User.find_by(id: params[:id])

    elsif params[:user][:id]
      @user = User.find_by(id: params[:user][:id])

    else params[:active_user_id]
      @user = User.find_by(id: params[:active_user_id])
    end
  end

  private
  def user_params
    params.require(:user).permit!
  end
end