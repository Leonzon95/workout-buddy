class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update]

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def edit

    end

    def update
        if @workout.update(workout_params)
            redirect_to workout_path(@workout)
        else
            render :edit
        end
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :is_private, :category_id)
    end

    def set_workout
        @workout = Workout.find_by_id(params[:id])
    end
end
