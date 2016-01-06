Rails.application.routes.draw do
  root 'parks#index'
  devise_for :users

  resources :parks
end
