class CategoryWorkout < ApplicationRecord
    belongs_to :category
    belongs_to :workout
end