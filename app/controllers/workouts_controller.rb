class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]
    before_action :login_required

    def index
        @workouts = current_user.workouts
    end

    def new
        @workout = Workout.new
    end

    def create
        # @workout = current_user.workouts.build(workout_params)
        @workout = Workout.new(workout_params)
        current_user.workouts << @workout
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

    def destroy
        current_user.workouts.delete(@workout)
        redirect_to root_path
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :is_private, category_ids:[], exercises_attributes: [:name, :reps, :sets, :user_id])
    end

    def set_workout
        @workout = Workout.find_by_id(params[:id])
    end
end
