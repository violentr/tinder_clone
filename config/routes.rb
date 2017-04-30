Rails.application.routes.draw do
  get 'users', to: "users#index"
  post '/users/attitude'

  get '/images', to: "images#index"
  post 'images/upload'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
