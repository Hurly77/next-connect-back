class Api::V1::SearchController < ApplicationController
  def index
    users = User.query(params[:query])
    if users
    render json: UserSerializer.new(users)
    else 
      render json: {status: 'not success'}
    end
  end
end
