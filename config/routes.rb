Rails.application.routes.draw do
  get 'home/index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  post 'home/index' => 'sessions#create'

  resources :users
  resources :places

  resources :sessions
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
