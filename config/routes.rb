Rails.application.routes.draw do
  root 'pages#main'
  get 'main/test'
  post 'main/test'
  get 'main/calculate'
  post 'main/calculate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
