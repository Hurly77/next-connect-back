class RegistrationsController < ApplicationController
  def create
    binding.pry
    user = User.create!(user_params)
    if user
      session[:user_id] = user.id
      render json: {status: 201, user: user, logged_in: true}
    else
      render json: { status: 500 }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
  
end