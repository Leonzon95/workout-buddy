Rails.application.routes.draw do
  resources :exercises
  resources :scheduled_workouts
  resources :exercise_workouts
  resources :workouts
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
