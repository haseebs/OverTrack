Rails.application.routes.draw do

  root   'pages#home'
  get    '/login',            to: 'sessions#new'
  post   '/login',            to: 'sessions#create'
  get    '/signup',           to: 'users#new'
  post   '/signup',           to: 'users#create'
  delete '/logout',           to: 'sessions#destroy'

  resources :users
  resources :group_stats,     only: [:index]
  resources :hero_stats,      only: [:index]
  resources :map_stats,       only: [:index]
  resources :map_hero_stats,  only: [:index]
  resources :matches,         only: [:index, :new, :create, :update, :destroy]
end
