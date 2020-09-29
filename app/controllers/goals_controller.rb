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

    def new
        @goal = Goal.new
    end

    def create
        @goal = Goal.create(goal_params)
        if @goal.save
            redirect_to user_entries_path(current_user), alert: "Your goal has been saved!"
        else
            render :new
        end
    end

    private

    def goal_params
        params.require(:goal).permit(:name, :description)
    end
end