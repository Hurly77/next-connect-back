class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)
    if user
      session[:user_id] = user.id
      render json: {status: create, user: user}
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end