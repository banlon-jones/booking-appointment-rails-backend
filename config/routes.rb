Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reservations, only: %i[index create]
  resources :resorts, only: %i[index show create update destroy]

  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#signup'
  post 'user-role', to: 'users#user_role'
end
