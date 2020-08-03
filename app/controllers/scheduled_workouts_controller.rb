class ScheduledWorkoutsController < ApplicationController
    before_action :set_workout, only: [:new, :create]
    before_action :private_and_owned, only: [:new, :create]
    
    def new
        @scheduled_workout = ScheduledWorkout.new
        @scheduled_workouts = current_user.scheduled_workouts
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

    def destroy
        @scheduled_workout = ScheduledWorkout.find_by_id(params[:id])
        if current_user.scheduled_workouts.include?(@scheduled_workout)
            @scheduled_workout.destroy
            redirect_to root_path
        else
            render 'application/not_owned'
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
