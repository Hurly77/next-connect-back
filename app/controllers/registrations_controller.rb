class RegistrationsController > ApplicationController
  def create
    user = User.creat!(
      email: params[:user][:email]
      password: params[:user][:password]
      password_confirmation: params[:user][:password_confirmation]
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: create,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end
  
end