class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    user.connect_id = user.id
    if user.save
      session[:user_id] = user.id
      render json: {status: 201, user: user, logged_in: true}
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, 
      :last_name, 
      :email, 
      :avatar, 
      :work,
      :education,
      :relationship,
      :lives,
      :from,
      :joined,
      :connect_id, 
      :password, 
      :password_confirmation)
  end
  
end