Money::Application.routes.draw do
  get 'signup' => 'welcome#signup'
  get 'signin' => 'welcome#signin'
  root 'welcome#signin'

  use_doorkeeper

  namespace :api, defaults: { format: 'json' } do
    scope module: 'v1' do
      resources :users, only: [:show, :create, :update, :destroy]
      resources :payment_sources, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index]
      resources :bills, except: [:edit, :new] do
        resources :tags, only: [:create, :destroy]
        resources :payments, only: [:create, :update, :destroy]
      end
    end
  end

  match '*path', to: 'welcome#signin', via: [:get]
end
