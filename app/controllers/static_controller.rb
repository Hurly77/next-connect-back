class StaticController < ApplicationController
  def home
    render json: {status: 'success'}
  end
end