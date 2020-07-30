Rails.application.routes.draw do
  
  resources :workouts do 
    resources :exercises, only: [:new, :create, :edit, :update, :destroy]
    resources :scheduled_workouts, only: [:new, :create, :destroy]
  end

  resources :categories

  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root 'application#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/public-workouts', to: 'workouts#public'
  delete '/logout', to: 'sessions#destroy'
  get '/scheduled-workouts', to: 'workouts#scheduled'
  match '*unmatched', to: 'application#route_not_found', via: :all
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
