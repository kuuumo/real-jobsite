Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/signup',      to:    'users#new'
  post   '/signup',      to:    'users#create'
  resources :sessions, only:    [:new, :create, :destroy]
  resources :users,    shallow: true do
    resources :jobs
    resources :likes,  only:    [:index, :create, :destroy]
    resources :rooms,  only:    [:index, :create] do
      resources :messages, only:  [:index, :create]
    end
  end

end
