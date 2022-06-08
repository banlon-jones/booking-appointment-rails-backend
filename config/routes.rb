Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'static#index'
  
  resources :reservations, only: %i[index create]
  resources :resorts, only: %i[index show create update destroy]

  get 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#signup'
end
