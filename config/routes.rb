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

  authenticated :user do
    root to: "dashboard#index",  as: :users_unauthenticated_root
  end

  # root to: "home#index",  as: :unauthenticated_root


end
