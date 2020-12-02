Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :posts
      resources :comments
      resources :search
      resources :friendships
      resources :users do 
        resources :freindships
      end
      resources :connections 
    end
  end
  resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to:  "sessions#logout" #added route
    get :logged_in, to: "sessions#logged_in" #added route
    root to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
