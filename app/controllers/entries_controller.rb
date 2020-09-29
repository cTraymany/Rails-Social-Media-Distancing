class EntriesController < ApplicationController
    before_action :set_entry, only: [:show, :edit]

    def index
        my_entries if !correct_user_link
        @user = current_user
    end
    
    def show
        if @entry && correct_user_link
            @goal = @entry.goal
        else
            my_entries
        end
    end

    def new
        redirect_to new_user_entry_path(current_user) if !correct_user_link
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
        redirect_to edit_user_entry_path(current_user, @entry) if !correct_user_link
        @entry ? @goals = Goal.all : my_entries
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

    def correct_user_link
        params[:user_id].to_i == current_user.id
    end

    def my_entries
        redirect_to user_entries_path(current_user)
    end

end