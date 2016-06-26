Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do

    get '/dashboard', to: 'base#dashboard'

    resources :users

    root to: 'base#dashboard'
  end

  root to: 'pages#index'

end
