Rails.application.routes.draw do
  root 'parks#index'
  # devise_for :users
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users, only: [:show]

  resources :parks
end
