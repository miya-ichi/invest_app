Rails.application.routes.draw do
  root to: 'possessions#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, except: %i(index)
  resources :possessions, except: %i(show)
end
