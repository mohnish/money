Money::Application.routes.draw do
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    scope module: 'v1' do
      resources :bills, except: [:edit, :new]
      resources :tags, only: [:index, :create, :destroy]
      resources :categories, except: [:edit, :new]
      resources :users, only: [:show, :create, :update, :destroy]
      resources :payment_sources, except: [:edit, :new]
      resources :payments, except: [:edit, :new]
    end
  end
end
