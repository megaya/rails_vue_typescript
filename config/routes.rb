Rails.application.routes.draw do
  constraints subdomain: 'www' do
    scope module: "www" do
      root 'home#index'
    end

    namespace 'api' do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  constraints subdomain: 'admin' do
  end
end
