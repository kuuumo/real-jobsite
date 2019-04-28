Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/signup',      to: 'users#new'
  post   '/signup',      to: 'users#create'
  get    '/login',       to: 'sessions#new'
  post   '/login',       to: 'sessions#create'
  delete '/logout',      to: 'sessions#destory'
  get    '/postjob',     to: 'jobs#new'
  post   '/postjob',     to: 'jobs#create'
  get    '/likesuser',   to: 'likes#index'
  resources :users
  resources :jobs
  resources :likes, only: [:create, :destroy]
end
