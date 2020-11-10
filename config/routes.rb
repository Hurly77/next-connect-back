Rails.application.routes.draw do
  resources :comments
  namespace :api do
    namespace :v1 do
      resources :users do 
        resources :posts
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
