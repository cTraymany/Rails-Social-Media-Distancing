class EntriesController < ApplicationController
    def index
        @entries = current_user.entries
    end
    
    def show
        # binding.pry
        @entry = current_user.entries.find_by(id: params[:id])
        @goal = @entry.goal

        
    end

end