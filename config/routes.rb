Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users
  root 'items#index'
  resources :users, only: [:new]
  resources :tweets, only: [:new, :create]
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :items do
    resources :buys, only: [:index, :create] 
  end
end
