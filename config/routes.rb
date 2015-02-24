Money::Application.routes.draw do
  root 'welcome#index'

  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    scope module: 'v1' do
      get '/users/me', to: 'users#me'
      resources :users, only: [:create, :update, :destroy]
      resources :payment_sources, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index]
      resources :repeat_intervals, only: [:index]
      resources :bills, except: [:edit, :new] do
        resources :tags, only: [:create, :destroy]
        resources :payments, only: [:index, :create, :update, :destroy]
      end
    end
  end

  match '*path', to: 'welcome#index', via: [:get]
end
