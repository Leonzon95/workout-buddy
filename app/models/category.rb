class Category < ApplicationRecord
    has_many :category_workouts
    has_many :workouts, through: :category_workouts

    def self.filter_workouts_by_categories(category)
        @workouts = category.workouts.where(is_private: false)
    end

end
