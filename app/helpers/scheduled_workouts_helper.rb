module ScheduledWorkoutsHelper
    def display_todays_workout
        workouts = current_user.scheduled_workouts.where(start_time: DateTime.current.beginning_of_day)
        if !workouts.empty?
            render partial: 'show_workout', locals: {workouts: workouts}
        else
            "You are resting today!"
        end
    end
end
