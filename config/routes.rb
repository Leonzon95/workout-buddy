Rails.application.routes.draw do
  
  resources :workouts do 
    resources :exercises, only: [:new, :create, :edit, :update, :destroy]
    resources :scheduled_workouts, only: [:new, :create]
  end

  delete '/scheduled-workouts/:id', to: 'scheduled_workouts#destroy', as: 'delete_from_calendar'
  get '/signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  root 'application#home'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/public-workouts', to: 'public_workouts#index', as: 'public'
  delete '/logout', to: 'sessions#destroy'
  get '/scheduled-workouts', to: 'workouts#scheduled'
  post '/categories', to: 'public_workouts#filter'
  get 'categories/:id/public-workouts', to: 'public_workouts#show', as: 'filter'
  get 'about', to: 'application#about'
  match '*unmatched', to: 'application#route_not_found', via: :all
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
