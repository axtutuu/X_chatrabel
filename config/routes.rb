Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"

  resources :chats, only: [:index, :new, :create]
  resources :rooms, only: [:index, :new, :create]
end
