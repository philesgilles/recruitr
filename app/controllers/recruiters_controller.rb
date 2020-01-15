class RecruitersController < ApplicationController
    before_action :set_recruiter, only:[:edit,:update,:show,:destroy]
    def index
        @recruiters = Recruiter.all
    end
    def show
        
    end
    def new
        @recruiter = Recruiter.new
    end
    def create
        #just check if params are passing
        #render plain: params[:recruiter].inspect

        @recruiter = Recruiter.new(recruiter_params)
        if @recruiter.save
            skill_params.each do |skill|
                @recruiter.recruiter_skill.create(skill_id:skill)
            end
            flash[:success] = "Positon was successfully created"
            redirect_to recruiter_path(@recruiter)    
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @recruiter.update(recruiter_params)
            flash[:success] = "Recruiter was successfully updated"
            redirect_to recruiter_path(@recruiter)    
        else
            render 'edit'
        end
        
    end
    def destroy
        @recruiter.destroy
        flash[:danger] = "recruiter was successfully deleted"
        redirect_to recruiters_path
        
    end

    private
    def set_recruiter
        @recruiter = Recruiter.find(params[:id])
    end
    def recruiter_params
        params.require(:recruiter).permit(:first_name,:last_name,:telephone, :email,:linked_in,:recruiter_id,:position_id)
    end
    def skill_params
        params.require(:skills_id)
    end
end
