Rails.application.routes.draw do
  root 'welcome#index'
  post '/welcome/upload', path: "/upload", to: "welcome#upload"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
