Rails.application.routes.draw do
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    # registrations: 'users/registrations',
    # omniauth_callbacks: 'omni_auth'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root to: "home#index"
  resources :dashboard


end
