Rails.application.routes.draw do
  resources :batch_imports do
    member do
      get :export_csv
    end
  end
  resources :orders
  resources :products
  resources :sellers
  resources :clients
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    # registrations: 'users/registrations',
    # omniauth_callbacks: 'omni_auth'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "home#index"
  get "dashboard", to: "dashboard#index"

end
