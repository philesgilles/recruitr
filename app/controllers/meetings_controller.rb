class MeetingsController < ApplicationController
    before_action :set_meeting, only:[:edit,:update,:show,:destroy]
    before_action :require_user
    def index
        
    end
    def new
        @candidate = Candidate.find(params[:id])
        @meeting = Meeting.new
    end
    def create
        @meeting = Meeting.new(meeting_params)
        if @meeting.save
            # Tell the UserMailer to send a welcome email after save
        MeetingMailer.with(meeting: @meeting).booked_meeting.deliver_later
            flash[:success] = "created"
            redirect_to meeting_path(@meeting) 
        else
            render 'new'
        end
    end
    def show
        
    end
    
    
    
    private
    def meeting_params
        params.require(:meeting).permit(:time,:place,:recruiter_id,:candidate_id)
    end
    def set_meeting
        @meeting = Meeting.find(params[:id])
    end
end