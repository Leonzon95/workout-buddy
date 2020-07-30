class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]
    before_action :login_required
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def index
        @workouts = current_user.created_workouts
    end

    def new
        @workout = Workout.new
        3.times {@workout.exercises.build}
    end

    def create
        @workout = current_user.created_workouts.build(workout_params)
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

    def public
        @workouts = Workout.public_workouts
    end

    def scheduled
        @workouts = current_user.workouts
    end

    def destroy
        if current_user.created_workouts.include?(@workout)
            @workout.destroy
            redirect_to root_path
        else
            current_user.workouts.delete(@workout)
            redirect_to root_path
        end
    end

    def handle_record_not_found
        render :not_found
    end

    private

    def workout_params
        params.require(:workout).permit(:name, :is_private, category_ids:[], exercises_attributes: [:name, :reps, :sets, :id])
    end

    def set_workout
        @workout = Workout.find_by_id(params[:id])
    end
end
