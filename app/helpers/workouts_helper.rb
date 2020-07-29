module WorkoutsHelper
    def display_categories(workout)
        workout.categories.each do |cat|
            cat.name
        end
    end
end
