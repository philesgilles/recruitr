class CandidatesController < ApplicationController
    before_action :set_candidate, only:[:edit,:update,:show,:destroy]
    def index
        @candidates = Candidate.all
    end
    def show
        
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
                debugger
                CandidateSkill.create(skill_id:skill,candidate_id:@candidate.id)
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

    private
    def set_candidate
        @candidate = Candidate.find(params[:id])
    end
    def candidate_params
        params.require(:candidate).permit(:first_name,:last_name,:telephone, :email,:linked_in,:recruiter_id,:position_id)
    end
    def skill_params
        params.require(:skills_id)
    end
end
