class MeetingsController < ApplicationController
    before_action :set_candidate, only:[:new]
    def index
        
    end
    def new
    end
    
    private
    def set_candidate
        @candidate = Candidate.find(params[:id])
    end
end