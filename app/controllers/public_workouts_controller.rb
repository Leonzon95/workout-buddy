class PublicWorkoutsController < ApplicationController
    before_action :login_required

    def index
        @workouts = Workout.public_workouts
    end

    def filter 
        if !params[:category_id].blank?
            redirect_to filter_path(params[:category_id])
        else
            redirect_to public_path
        end
    end

    def show
        category = Category.find_by_id(params[:id])
        @workouts = Category.filter_workouts_by_categories(category)
        render :index
    end

    def most_popular
        category = Category.most_popular_category
        @workouts = Category.filter_workouts_by_categories(category[0])
        render :index
    end
end