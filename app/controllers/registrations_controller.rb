class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    user.c_id = user.first_name + user.last_name + user.id.to_s
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
      :c_id, 
      :password, 
      :password_confirmation,
    )
  end
  
end