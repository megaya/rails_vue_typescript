class Api::Www::BaseController < ApplicationController
  before_action :authenticate_api_www_user!
end
