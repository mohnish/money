Money::Application.routes.draw do
  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    scope module: 'v1' do
      resources :categories, only: [:index]
      resources :users, only: [:show, :create, :update, :destroy] do
        resources :bills, except: [:edit, :new] do
          resources :tags, only: [:create, :destroy]
          resources :payment_sources, except: [:edit, :new, :show]
          resources :payments, only: [:create, :destroy]
        end
      end
    end
  end
end
