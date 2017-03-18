Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do

    get '/dashboard', to: 'base#dashboard'

    resources :couriers
    resources :packages
    resources :products
    resources :shippable_countries
    resources :users
    resources :zone_pricings
    resources :zones

    root to: 'base#dashboard'
  end

  resources :contacts, only: [:update]
  resources :billings, only: [:index, :update]
  resources :line_items, only: [:create, :update, :destroy]
  resources :products, only: [:index, :show]
  resources :payments, only: [:index, :show]

  get 'shopping_cart', to: 'shopping_carts#index'

  get 'about-us', to: 'pages#about'
  get 'privacy-policy', to: 'pages#privacy'
  get 'terms-and-conditions', to: 'pages#terms'

  root to: 'pages#index'

end
