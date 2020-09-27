class ApplicationController < ActionController::Base
    # before_action :redirect_if_logged_in, only: [:index]
    helper_method :current_user

    def index
        # binding.pry
    end

    def redirect_if_logged_in
        redirect_to users_path if current_user
        # redirect_to users_goals_path if current_user
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
end
