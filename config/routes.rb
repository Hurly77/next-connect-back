Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :posts
      resources :comments
      resources :search
      resources :friendships
      resources :photos
      resources :post_photos
      resources :photos do 
        resource :users
      end
      resources :users do 
        resources :friendships
        get :friends, to: "posts#friends"
        get :all_posts, to: "posts#all_posts"
        get :existing_user, to: "users#existing_user"
        resources :posts
      end
    post :friend_request, to: 'friendships#friend_request'
    post :accept, to: 'friendships#accept'
    end
  end
  resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to:  "sessions#logout" #added route
    get :logged_in, to: "sessions#logged_in" #added route
    
    root to: "static#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
