class EntriesController < ApplicationController
    def index
        if params[:user_id].to_i == current_user.id
            @user = current_user
        else
            redirect_to user_entries_path(current_user)
        end
    end
    
    def show
        @entry = current_user.entries.find_by(id: params[:id])
        if @entry && params[:user_id].to_i == current_user.id
            @goal = @entry.goal
        else
            redirect_to user_entries_path(current_user)
        end
    end

    def new
        if params[:user_id].to_i != current_user.id
            redirect_to new_user_entry_path(current_user)
        else
            @entry = current_user.entries.new
            @goal = Goal.new
            @goals = Goal.all
        end
    end

    def create
        @entry = current_user.entries.create(entry_params)
        if @entry.save
            redirect_to user_entry_path(current_user, @entry)
        else
            render :new
        end
    end
    
    # def edit
    #     @entry = current_user.entries.find_by(id: params[:id])
    #     @goals = Goal.all
    # end
    
    # def update

    # end

    private

    def entry_params
        params.require(:entry).permit(:title, :content, :user_id,:goal_id)
    end

end