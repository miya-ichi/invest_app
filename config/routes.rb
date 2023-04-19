Rails.application.routes.draw do
  get 'notes/index'
  get 'notes/new'
  get 'notes/edit'
  root to: 'static_pages#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'dashboard#index'

  resources :users, except: %i(index show edit)
  resources :possessions, except: %i(show)
end
