Rails.application.routes.draw do

  get 'rooms/show'
  get 'rooms/index'
  root   'static_pages#home'
  get    '/signup',      to: 'users#new'
  post   '/signup',      to: 'users#create'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, shallow: true do
    resources :jobs
    resources :likes, only: [:create, :destroy, :index]
  end

end
