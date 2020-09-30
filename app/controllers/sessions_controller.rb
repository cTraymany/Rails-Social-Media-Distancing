class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new, :create]

    def new;  end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            show_welcome_page
        else
            @errors = ["Please enter a valid email and password."]
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

end