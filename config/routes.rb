Rails.application.routes.draw do
  constraints subdomain: 'www' do
    scope module: "www" do
      root 'home#index'
    end
  end

  constraints subdomain: 'admin' do
  end
end
