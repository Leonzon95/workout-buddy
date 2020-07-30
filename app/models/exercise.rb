class Exercise < ApplicationRecord
  has_many :exercise_workouts
  belongs_to :workout

  validates :name, presence: true
  validates :sets, presence: true
  validates :reps, presence: true

end
