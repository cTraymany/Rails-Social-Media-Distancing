class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new, :create]
    before_action :require_login, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            show_welcome_page
        else
            render :new
        end
    end
    
    def show
        if params[:id].to_i == current_user.id
            @user = current_user
        else
            show_welcome_page
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
