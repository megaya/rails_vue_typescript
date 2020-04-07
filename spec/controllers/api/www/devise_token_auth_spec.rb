require "rails_helper"

RSpec.describe 'Api::Www::DeviseTokenAuth', type: :request do
  describe "sign_up" do
    it "ユーザが作成される" do
      post "/api/www/auth", params: { email: "example@example.com", password: "password",  password_confirmation: "password" }, headers: { 'CONTENT_TYPE' => 'application/json' }
      expect(response).to have_http_status(200)
    end
  end

  describe "sign_in" do
    let(:email) { 'example@example.com' }
    let(:password) { 'password' }
    let(:user) { create(:user, email: email, password: password) }
    it "ログインに成功する" do
      auth_headers = user.create_new_auth_token
      headers = {
        'CONTENT_TYPE' => 'application/json',
        'ACCEPT' => 'application/json',
        'Uid' => auth_headers['uid'],
        'Access-Token' => auth_headers['access-token'],
        'Client' => auth_headers['client']
      }
      post "/api/www/auth/sign_in", params: { email: email, password: password }, headers: headers
      expect(response).to have_http_status(200)
    end
  end

  describe "authenticate_api_www_user!" do
    it "トークンがない状態だとアクセスに失敗する" do
      get "/api/www/users/1"
      expect(response).to have_http_status(401)
    end
  end
end