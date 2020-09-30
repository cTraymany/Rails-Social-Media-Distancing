class GoalsController < ApplicationController
    before_action :require_login#, :

    def index
        if correct_user_link
            @user = current_user
            @goals = @user.goals
        else
            show_my_goals
        end
    end

    def show
        @goal = current_user.goals.find_by(id: params[:id])
        unless @goal && correct_user_link
            show_my_goals
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

    def show_my_goals
        redirect_to user_goals_path(current_user)
    end
end