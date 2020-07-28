class Exercise < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts
end
