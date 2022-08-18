Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    mount_devise_token_auth_for 'User', at: 'auth'
    
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
      resources :albums, only: :show do 
        resources :recently_heards, only: :create #api/v1/albuns/:id/recently_heards
      end
    end
  end

end
