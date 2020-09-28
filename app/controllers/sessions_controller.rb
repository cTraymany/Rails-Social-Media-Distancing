class SessionsController < ApplicationController
    # before_action :redirect_if_logged_in#, except: [:destroy]

    def new;  end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @errors = ["Please enter a valid email and password."]
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    # def github_login
    #     user = User.find_or_create_from_auth_hash(auth_hash)
    #     session[:user_id] = user.id
    #     redirect_to user_path(user)
    # end
    
    # private

    # def auth_hash
    #     request.env["omniauth.auth"]
    # end

end