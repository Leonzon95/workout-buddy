module ExerciseWorkoutsHelper
    def display_edit_for_exercise(workout, exercise)
        if current_user.created_workouts.include?(workout)
            link_to 'Edit Exercise', edit_workout_exercise_path(@workout, exercise), class: 'btn btn-default btn-xs'
        end
    end

    def display_delete_for_exercise(workout, exercise)
        if current_user.created_workouts.include?(workout)
            link_to 'Delete Exercise', [workout, exercise], method: :delete, class: 'btn btn-primary btn-xs'
        end
    end

    def display_add_exersice(workout)
        if current_user.created_workouts.include?(workout)
            link_to 'Add Exercise', new_workout_exercise_path(workout), class: 'btn btn-primary'
        end
    end
end
