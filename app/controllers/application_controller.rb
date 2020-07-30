class ApplicationController < ActionController::Base
    include UsersHelper
    protect_from_forgery with: :exception
    
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


end
