class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login

    def index;  end

    def redirect_if_logged_in
        redirect_to user_path(current_user) if current_user
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to root_path if !current_user
    end
end
