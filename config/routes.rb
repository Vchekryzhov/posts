Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "post#index"

  get '/posts', to: 'post#index'
  get 'post/:id', to: "post#show", as: "post"
  post '/post/create', to: "post#create"
  post '/post/update/:id', to: "post#update", as: "post_update"


end
