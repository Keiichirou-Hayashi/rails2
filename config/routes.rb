Rails.application.routes.draw do
  root 'rooms#index'

  devise_for :users

  resources :users, only: [:show]
  
  get 'rooms/index'
  get 'rooms/show'
  get 'users/index'

  resources :users do
    get :autocomplete_user_username, on: :collection
  end
  resources :users
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
