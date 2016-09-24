Rails.application.routes.draw do
  devise_for :users
  get 'index', to: 'users#index'
  get 'profile', to: 'users#show'
  get 'edit', to: 'users#edit'
  post 'edit', to: 'users#update'
  get 'signup', to: 'users#new'
  resources :posts do 
  	resources :comments
  end
  resources :users

  root 'users#index'
end
