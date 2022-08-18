Rails.application.routes.draw do
  
  root 'home#index'
    
  concern :favoritable do |options|
    shallow do
      post '/favorite', { to: "favorites#create", on: :member }.merge(options)
      delete '/favorite',  { to: "favorites#destroy", on: :member }.merge(options)
    end
  end 

  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'  
    
    namespace :v1 do
      resources :dashboard, only: :index
      resources :categories, only: [:index, :show]
      resources :search, only: :index
      resources :albums, only: :show do
        resources :recently_heards, only: :create
        concerns :favoritable, favoritable_type: 'Album'
      end
      resources :favorites, only: :index

      resources :songs, only: [] do
        concerns :favoritable, favoritable_type: 'Song'
      end

      resources :artists, only: [] do
        concerns :favoritable, favoritable_type: 'Artist'
      end
    end
  end

end
