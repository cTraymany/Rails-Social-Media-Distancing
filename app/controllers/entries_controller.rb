class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit]

    def index
        redirect_to user_entries_path(current_user) if !correct_link_id
        @user = current_user
    end
    
    def show
        if @entry && correct_link_id
            @goal = @entry.goal
        else
            redirect_to user_entries_path(current_user)
        end
    end

    def new
        redirect_to new_user_entry_path(current_user) if !correct_link_id
        @entry = current_user.entries.new
        @goal = Goal.new
        @goals = Goal.all
    end

    def create
        @entry = current_user.entries.create(entry_params)
        if @entry.save
            redirect_to user_entry_path(current_user, @entry)
        else
            render :new
        end
    end
    
    def edit
        if params[:user_id].to_i != current_user.id
            redirect_to edit_user_entry_path(current_user, @entry)
        elsif @entry
            @goals = Goal.all
        else
            redirect_to user_entry_path(current_user)
        end
    end
    
    # def update

    # end

    private

    def entry_params
        params.require(:entry).permit(:title, :content, :user_id,:goal_id)
    end

    def set_entry
        @entry = current_user.entries.find_by(id: params[:id])
    end

    def correct_link_id
        params[:user_id].to_i == current_user.id
    end

end