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
    if user.update_attributes(user_params)
      user.save
      render json: {user: user}
    else 
      render json: {message: "no user exists"}
    end
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
    friendship = Friendship.find_by(active_user_id: params[:active_user_id], passive_user_id: params[:passive_user_id])
    friendship.destroy
    render json: {pending_friends: user.pending_friends}
  end


  def user
    if session[:user_id] 
      @current_user = User.find_by(id: [:user_id])
    end
  end

  def existing_user
    if find = User.find_user_by_c_id(params[:c_id])
      render json: find
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :id,
      :photo_url,
      :banner_url,
      :first_name, 
      :last_name, 
      :email, 
      :work,
      :education,
      :relationship,
      :lives,
      :from,
      :joined,
      :c_id,
      :created_at,
      :updated_at,
      :password_digest,
      :avatar, 
    )
  end
end