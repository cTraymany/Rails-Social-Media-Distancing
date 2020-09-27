class UsersController < ApplicationController
    # before_action :redirect_if_logged_in
    helper_method :current_user

    def index
        # delete after adding 'users/goals' as index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end
    
    def show
        @user = current_user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
