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

end