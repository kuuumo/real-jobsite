Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/signup',      to: 'users#new'
  post   '/signup',      to: 'users#create'
  get    '/login',       to: 'sessions#new'
  post   '/login',       to: 'sessions#create'
  delete '/logout',      to: 'sessions#destory'
  resources :users, shallow: true do
    resources :jobs
    resources :likes, only: [:create, :destroy, :index]
  end

end
