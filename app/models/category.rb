class Category < ApplicationRecord
    has_many :category_workouts
    has_many :workouts, through: :category_workouts
end
