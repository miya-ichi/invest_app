Rails.application.routes.draw do
  get 'dashboard/index'
  root to: 'static_pages#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: %i(index show edit)
  resources :possessions, except: %i(show)
end
