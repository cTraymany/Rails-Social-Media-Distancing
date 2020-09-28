class GoalsController < ApplicationController
    def index
        if params[:user_id].to_i == current_user.id
            @user = current_user
            @goals = @user.goals
        else
            redirect_to user_goals_path(current_user)
        end
    end

    def show
        @goal = current_user.goals.find_by(id: params[:id])
        unless @goal && params[:user_id].to_i == current_user.id
            redirect_to user_goals_path(current_user)
        end
    end
end