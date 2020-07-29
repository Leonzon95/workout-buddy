Rails.application.routes.draw do
  
  resources :workouts do 
    resources :exercises, only: [:new, :create, :edit, :update, :show]
    resources :scheduled_workouts, only: [:new, :create]
  end
  resources :exercises, only: [:index, :show]

  resources :categories
  resources :users, only: [:show]
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root 'application#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
