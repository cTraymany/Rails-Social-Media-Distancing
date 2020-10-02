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

    def google_login
        # binding.pry
        @user = User.find_or_create_by(email: auth_hash[:email]) do |u|
            u.password = SecureRandom.hex
            u.name = auth_hash[:first_name]
        end
        
        session[:user_id] = @user.id
        redirect_to user_path(current_user)
    end
    
    private
    
    def auth_hash
        request.env['omniauth.auth']['info']
    end
end