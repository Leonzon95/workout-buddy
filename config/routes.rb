Rails.application.routes.draw do
  
  resources :workouts do 
    resources :exercises, only: [:new, :create, :edit, :update, :destroy]
    resources :scheduled_workouts, only: [:new, :create]
  end



  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root 'application#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/public-workouts', to: 'workouts#public', as: 'public'
  delete '/logout', to: 'sessions#destroy'
  get '/scheduled-workouts', to: 'workouts#scheduled'
  post '/categories', to: 'categories#filter'
  get 'categories/:id/public-workouts', to: 'categories#show', as: 'filter'
  match '*unmatched', to: 'application#route_not_found', via: :all
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
