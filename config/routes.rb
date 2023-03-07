Rails.application.routes.draw do
  resources :users, only: %i[create]
  post '/user/login', to: 'users#login'
  resources :campaigns, only: %i[create show update destroy]
  get '/user/campaigns/:id', to: 'campaigns#index'
  resources :locations, only: %i[index create show update destroy]
  resources :sub_locations, only: %i[index create show update destroy]
  resources :characters, only: %i[index create show update destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
