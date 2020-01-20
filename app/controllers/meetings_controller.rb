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
            #mailing system
            #MeetingMailer.with(meeting: @meeting).booked_meeting.deliver_later
            
            flash[:success] = "Meeting successfully created"
            redirect_to candidate_path(@meeting.candidate) 
        else
            render 'new'
        end
    end
    def show
        
    end
    def destroy
        @meeting = Meeting.find(params[:id])
        @candidate = @meeting.candidate
        if @meeting.destroy
            flash[:warning] = "Meeting was successfully deleted"
            redirect_to candidate_path(@candidate)
        else 
            flash[:danger] = "There was a problem"
            redirect_to candidate_path(@candidate)
        end
        
    end
    
    
    private
    def meeting_params
        params.require(:meeting).permit(:time,:place,:recruiter_id,:candidate_id)
    end
    def set_meeting
        @meeting = Meeting.find(params[:id])
    end
end