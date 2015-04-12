Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"

  resources :chats, only: :index
  resources :rooms, only: [:index, :new, :create]
  post 'chats/post' =>'chats#post'
end
