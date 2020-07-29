module UsersHelper
    def current_user
        User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!session[:user_id]
    end

    def login_required
        if !logged_in?
            redirect_to root_path
        end
    end
end
