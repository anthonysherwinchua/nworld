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
    resources :zone_range_pricings
    resources :zones

    root to: 'base#dashboard'
  end

  resources :line_items, only: [:create, :update, :destroy]
  resources :products, only: [:index, :show]
  resources :shipping, only: [:update]

  get 'shopping_cart', to: 'shopping_carts#index'

  root to: 'pages#index'

end
