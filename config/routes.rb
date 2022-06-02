Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#signup'
end
