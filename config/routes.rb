Rails.application.routes.draw do
  get 'sessions/new'
  resources :users, except: %i(index)
end
