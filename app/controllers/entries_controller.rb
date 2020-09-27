class EntriesController < ApplicationController
    def index
        @entries = Entry.all
    end
    
    def show
        @entry = Entry.find_by(params[:id])
        @goal = @entry.goal
    end

end