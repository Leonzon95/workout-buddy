module WorkoutsHelper
    def display_categories(workout)
        workout.categories.each do |cat|
            cat.name
        end
    end

    def display_edit_workout(workout)
        if current_user.created_workouts.include?(workout)
            link_to 'Edit Workout', edit_workout_path(workout)
        end
    end

    def display_delete_workout(workout)
        if current_user.created_workouts.include?(workout)
            link_to 'Delete Workout', workout, method: :delete 
        elsif current_user.workouts.include?(workout)
            link_to 'Remove from Calendar', workout, method: :delete
        end
    end

    def display_is_private
        
    end
end
