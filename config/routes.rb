Rails.application.routes.draw do

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        devise_for :users, controllers: { registrations: 'api/v1/registrations',
                                          sessions:       'api/v1/sessions'}
        resources :votes, only: [:create, :update]
      end
    end
  end

  root 'parks#index'

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:show]

  resources :parks do
    resources :reviews, only: [:create, :edit, :update, :destroy] do
      resources :votes, only: [:create, :update]
    end
  end
end
