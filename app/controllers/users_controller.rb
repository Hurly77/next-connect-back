class UsersController < ApplicationController

  def index
  users = User.all
  render json: UserSerializer.new(users)
  end  

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else 
      render json: {error: 'Error creating account'}
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end
  
  def update
    
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
