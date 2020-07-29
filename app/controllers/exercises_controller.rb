class ExercisesController < ApplicationController
    before_action :login_required
    before_action :set_exercise, only: [:show, :update, :edit, :destroy]

    def new
        @exercise = Exercise.new
    end

    def create
        @exercise = current_user.exercises.build(exercise_params)
        if @exercise.save
            
            redirect_to exercise_path(@exercise)
        else
            render :new
        end
    end

    def show

    end

    def edit

    end

    def update
        if @exercise.update(exercise_params)
            redirect_to exercise_path(@exercise)
        else
            render :edit
        end
    end

    def destroy
        @exercise.destroy
        redirect_to root_path
    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :reps, :sets)
    end

    def set_exercise
        @exercise = Exercise.find_by_id(params[:id])
    end
end
