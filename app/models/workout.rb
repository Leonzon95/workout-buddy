class Workout < ApplicationRecord
  has_many :scheduled_workouts, dependent: :destroy
  has_many :users, through: :scheduled_workouts
  has_many :exercise_workouts, dependent: :destroy
  has_many :exercises, through: :exercise_workouts, dependent: :destroy
  has_many :category_workouts, dependent: :destroy
  has_many :categories, through: :category_workouts

  validates :name, presence: true

  accepts_nested_attributes_for :exercises
end
