Rails.application.routes.draw do
  devise_for :users
  root to: "chatrooms#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show
end
