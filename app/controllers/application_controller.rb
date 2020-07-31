class ApplicationController < ActionController::Base
    include UsersHelper
    include ApplicationHelper
    protect_from_forgery with: :exception
    helper_method :private_and_owned
    helper_method :public_and_owned
    
    def home
        if logged_in?
            @scheduled_workouts = current_user.scheduled_workouts
            render :index
        else
            render :home
        end
    end

    def route_not_found

    end

    def private_and_owned
        if @workout.is_private && !current_user.created_workouts.include?(@workout)
            render :not_owned
        end
    end

    def public_and_owned
        if !@workout.is_private && !current_user.created_workouts.include?(@workout)
            render :not_owned
        end
    end
end
