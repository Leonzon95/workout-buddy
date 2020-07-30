module CategoriesHelper
    def display_categories_from_workout(workout)
        workout.categories.map{|category| category.name}.join(" | ")
    end
end
