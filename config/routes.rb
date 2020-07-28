Rails.application.routes.draw do
  resources :exercises
  resources :workouts
  resources :categories
  resources :users, only: [:show]
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  root 'application#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
