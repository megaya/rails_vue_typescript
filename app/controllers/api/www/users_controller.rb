class Api::Www::UsersController < ApplicationController

  def show
    render json: User.first
  end
end