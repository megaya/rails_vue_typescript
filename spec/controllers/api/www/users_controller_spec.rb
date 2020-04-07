require "rails_helper"

RSpec.describe Api::Www::UsersController, type: :request do
  let(:default_request_headers) { sign_in(user) }
  let(:user) { create(:user) }

  describe "show" do
    it "ユーザを取得" do
      get "/api/www/users/1"
      expect(response).to have_http_status(200)
    end
  end
end