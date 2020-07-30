class ScheduledWorkoutsController < ApplicationController
    before_action :set_workout
    before_action :private_and_owned
    
    def new
        @scheduled_workout = ScheduledWorkout.new
    end

    def create
        @scheduled_workout = current_user.scheduled_workouts.build(scheduled_params)
        @scheduled_workout.workout = @workout
        if @scheduled_workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    private 
    
    def scheduled_params
        params.require(:scheduled_workout).permit(:start_time, :workout_id)
    end

    def set_workout
        @workout = Workout.find_by_id(params[:workout_id])
    end
end
