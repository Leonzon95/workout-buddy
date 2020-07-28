class Workout < ApplicationRecord
  belongs_to :category
  has_many :scheduled_workouts
  has_many :users, through: :scheduled_workouts
  has_many :exercise_workouts
  has_many :exercises, through: :exercise_workouts
end
