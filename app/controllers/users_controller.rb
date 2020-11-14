class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else 
      render json: {status: "not successful"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
