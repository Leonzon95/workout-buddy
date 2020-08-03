class Category < ApplicationRecord
    has_many :category_workouts
    has_many :workouts, through: :category_workouts

    scope :most_popular_category, -> {joins(:category_workouts, :workouts).select('categories.*, COUNT(workouts.id) as workout_count').where(workouts: {is_private: false}).group('id').order(workout_count: :desc).limit(1)}

    def self.filter_workouts_by_categories(category)
        @workouts = category.workouts.where(is_private: false)
    end
end
