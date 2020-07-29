class ExercisesController < ApplicationController
    before_action :login_required

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

    end

    private

    def exercise_params
        params.require(:exercise).permit(:name, :reps, :sets)
    end
end
