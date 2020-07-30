class CategoriesController < ApplicationController
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
        render 'workouts/public'
    end
end
