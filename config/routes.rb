Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    mount_devise_token_auth_for 'User', at: 'auth'
    
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
    end
  end

end
