class ApplicationController < ActionController::Base
    include UsersHelper
    
    def home
        if logged_in?
            render :index
        else
            render :home
        end
    end
end
