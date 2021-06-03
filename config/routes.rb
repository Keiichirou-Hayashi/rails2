Rails.application.routes.draw do
  get 'reservations/index'
  root 'users#index'
  get 'search', to: 'rooms#search'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get 'sign_in', :to => "users/sessions#new"
    get 'sign_out', :to => "users/sessions#destroy" 
  end


  resources :users, only: [:show]
  

  get 'rooms/index'
  get 'rooms/show'
  get 'users/index'
  get 'rooms/posts', to: 'rooms#posts'
  

  resources :users do
    get :autocomplete_user_username, on: :collection
    get 'account', on: :member
    resources :rooms do
      resources :reservations
    end
  end

  resources :rooms do
    resources :reservations
    get 'posts', on: :collection
    get 'search', on: :member
    get 'confirm', on: :member
  end

  resources :reservations
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end