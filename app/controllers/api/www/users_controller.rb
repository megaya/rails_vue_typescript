class Api::Www::UsersController < Api::Www::BaseController

  def show
    render json: User.first
  end
end