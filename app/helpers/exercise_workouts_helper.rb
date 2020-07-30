module ExerciseWorkoutsHelper
    def display_edit_for_exercise(workout, exercise)
        if current_user.created_workouts.include?(workout)
            link_to 'Edit Exercise', edit_workout_exercise_path(@workout, exercise)
        end
    end

    def display_delete_for_exercise(workout, exercise)
        if current_user.created_workouts.include?(workout)
            link_to 'Delete Exercise', [workout, exercise], method: :delete
        end
    end

    def display_add_exersice(workout)
        if current_user.created_workouts.include?(workout)
            link_to 'Add Exercise', new_workout_exercise_path(workout)
        end
    end
end
