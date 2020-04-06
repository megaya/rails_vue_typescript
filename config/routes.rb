Rails.application.routes.draw do
  constraints subdomain: 'www' do
    scope module: "www" do
      root 'home#index'
    end
    namespace 'api' do
      namespace "www" do
        mount_devise_token_auth_for 'User', at: 'auth'
        resources :users, only: [:show]
      end
    end
  end

  constraints subdomain: 'admin' do
  end
end
