class GoalsController < ApplicationController
    def index
        @goals = current_user.goals
        @user = current_user
    end

    def show
        @goal = current_user.goals.find_by(params[:goal_id])
    end
end