class Exercise < ApplicationRecord
  belongs_to :user
  has_many :exercise_workouts
  has_many :workouts, through: :exercise_workouts, dependent: :delete_all

  validates :name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true

end
