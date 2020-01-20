class MeetingMailer < ApplicationMailer
    default from: 'notifications@example.com'
    def booked_meeting
    @meeting = params[:meeting]
    #@url  = 'http://example.com/login'
    #mail(:to => (@meeting.candidate.email, @meeting.recruiter.email), subject: 'New interview booked')
    end
    
end
