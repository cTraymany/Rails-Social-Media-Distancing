class JourneysController < ApplicationController
    before_action :require_login
    before_action :set_journey, only: [:show, :edit, :destroy]

    def index
        show_my_journeys if !correct_user_link
        @user = current_user
        @journeys = @user.journeys.search(params[:query])
        @query = params[:query]
    end
    
    def show
        if @journey && correct_user_link
            @goal = @journey.goal
        else
            show_my_journeys
        end
    end

    def new
        redirect_to new_user_journey_path(current_user) if !correct_user_link
        @journey = current_user.journeys.new
        @goals = Goal.all
    end

    def create
        @journey = current_user.journeys.create(journey_params)
        if @journey.save
            redirect_to user_journey_path(current_user, @journey)
        else
            @goals = Goal.all
            render :new
        end
    end
    
    def edit
        redirect_to edit_user_journey_path(current_user, @journey) if !correct_user_link
        @journey ? @goals = Goal.all : show_my_journeys
    end
    
    def update
        @journey = current_user.journeys.find_by(id: params[:id])
        if @journey.update(journey_params)
            redirect_to user_journey_path(current_user, @journey)
        else
            @goals = Goal.all
            render :edit
        end
    end

    def destroy
        @journey.destroy
        show_my_journeys
    end

    private

    def journey_params
        params.require(:journey).permit(:title, :content, :user_id, :goal_id)
    end

    def set_journey
        @journey = current_user.journeys.find_by(id: params[:id])
    end

    def show_my_journeys
        redirect_to user_journeys_path(current_user)
    end

end