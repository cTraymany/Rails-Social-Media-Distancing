class UsersController < ApplicationController
    
    def index
        # delete after adding 'users/goals' as index
    end

    def new
        @user = User.new
    end

    def create

    end

    private

    def user_params
        
    end
end
