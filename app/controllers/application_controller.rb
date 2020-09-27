class ApplicationController < ActionController::Base
    before_action :redirect_if_logged_in, only: [:index]

    def index; end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_logged_in
        redirect_to users_path if logged_in?
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
end
