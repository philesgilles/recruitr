class CandidatesController < ApplicationController
    before_action :set_candidate, only:[:edit,:update,:show,:destroy,:add_recruiter,:remove_recruiter]
    before_action :require_user
    def index
        @candidates = Candidate.all
    end
    def show
        @recruiters = Recruiter.all
    end
    def new
        @candidate = Candidate.new
    end
    def create
        #just check if params are passing
        #render plain: params[:candidate].inspect

        @candidate = Candidate.new(candidate_params)
        if @candidate.save
            skill_params.each do |skill|
                @candidate.candidate_skill.create(skill_id:skill)
            end
            flash[:success] = "Positon was successfully created"
            redirect_to candidate_path(@candidate) 
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @candidate.update(candidate_params)
            flash[:success] = "Candidate was successfully updated"
            redirect_to candidate_path(@candidate)    
        else
            render 'edit'
        end
        
    end
    def destroy
        @candidate.destroy
        flash[:danger] = "candidate was successfully deleted"
        redirect_to candidates_path
        
    end
    def add_recruiter
        @candidate.recruiter_id = params[:recruiter]
        if @candidate.save
            flash[:success] = "Recruiter was added to candidate"
            redirect_to candidate_path(@candidate)    
        else 
            flash[:danger] = "Holy guacamole ! there was a problem !"
            redirect_to candidate_path(@candidate)    
        end
    end
    def remove_recruiter
        @candidate.recruiter_id = nil
        if @candidate.save
            flash[:warning] = "Recruiter was Removed from candidate"
            redirect_to candidate_path(@candidate)    
        else 
            flash[:danger] = "Holy guacamole ! there was a problem !"
            redirect_to candidate_path(@candidate)    
        end
    end
    
    

    private
    def set_candidate
        @candidate = Candidate.find(params[:id])
    end
    def candidate_params
        params.require(:candidate).permit(:first_name,:last_name,:telephone, :email,:linked_in,:github,:position_id,:recruiter_id)
    end
    def skill_params
        params.require(:skills_id)
    end
end
