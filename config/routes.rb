Rails.application.routes.draw do
  get '/users/cities_select' => 'users#cities_select'
  devise_for :users
  resources :users

  root to: "top#index"
  get '/search' => "top#search"

  resources :chats, only: :index
  resources :rooms, only: [:index, :new, :create]
  post 'chats/post' =>'chats#post'
end
