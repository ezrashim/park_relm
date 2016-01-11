Rails.application.routes.draw do
  root 'parks#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :parks do
    resources :reviews, only: [:create, :edit, :update]
  end
end
