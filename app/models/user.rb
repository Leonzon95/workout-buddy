class User < ApplicationRecord
    has_many :scheduled_workouts
    has_many :workouts, through: :scheduled_workouts
    has_many :exercises
end
