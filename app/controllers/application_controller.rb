class ApplicationController < ActionController::Base
    include UsersHelper
    
    def home
        if logged_in?
            @scheduled_workouts = current_user.scheduled_workouts
            render :index
        else
            render :home
        end
    end
end
