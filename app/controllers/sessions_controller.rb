class SessionsController < ApplicationController
    before_action :not_logged_in_required, only: [:new, :create, :omniauth]
    before_action :login_required, only: [:destroy]
    
    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:message] = "The username or password you entered is incorrect"
            redirect_to :login
        end
    end

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:message] = user.errors.full_messages
            redirect_to root_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end