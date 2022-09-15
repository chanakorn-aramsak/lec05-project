Rails.application.routes.draw do
 
  root 'pages#main'
  get 'main/test'
  post 'main/test'
  get 'main/calculate'
  post 'main/calculate'
  post 'score/delete'
  get 'score/delete'
  post 'score/edit'
   get 'score/list'
  get 'score/edit'
  post 'score/list'
  post 'score/edited',to: redirect('score/list')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
