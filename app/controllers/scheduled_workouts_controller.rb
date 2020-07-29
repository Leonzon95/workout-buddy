class ScheduledWorkoutsController < ApplicationController
    before_action :set_workout

    def new
        @scheduled_workout = ScheduledWorkout.new
    end

    def create
        
    end

    private 
    
    def scheduled_params
        params.require(:scheduled_workout).permit(:start_time, :workout_id)
    end

    def set_workout
        @workout = Workout.find_by_id(params[:workout_id])
    end
end
