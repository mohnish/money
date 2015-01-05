Money::Application.routes.draw do
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    scope module: 'v1' do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :payment_sources, only: [:create, :update, :destroy]
      resources :categories, only: [:index]
      resources :bills, except: [:edit, :new] do
        resources :tags, only: [:create, :destroy]
        resources :payments, only: [:create]
      end
    end
  end
end
