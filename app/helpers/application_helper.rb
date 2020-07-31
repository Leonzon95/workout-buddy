module ApplicationHelper
    def not_logged_in_required
        if logged_in?
            redirect_to root_path
        end
    end
end
