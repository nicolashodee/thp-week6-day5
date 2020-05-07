Rails.application.routes.draw do
  resources :gossips
  resources :comments

  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:show]
  
  root 'gossips#index'
  get '/welcome/:id', to: 'welcome#show', as: 'welcome'
  get '/users', to: 'users#new'
  get '/contact', to: 'welcome#contact'
  get '/team', to: 'welcome#team'
end
