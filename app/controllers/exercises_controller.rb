class ExercisesController < ApplicationController
    before_action :login_required

    def new
        @exercise = Exercise.new
    end

    def create
        @exercise = Exercise.new(exercise_params)
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
end
