class PositionsController < ApplicationController
    before_action :set_position, only:[:edit,:update,:show,:destroy]
    def index
        
    end

    def new
        @position = Position.new
    end
    def create
        #just check if params are passing
        render plain: params[:position].inspect

        @position = Position.new(position_params)
        if @position.save
            flash[:success] = "Positon was successfully created"
            redirect_to position_path(@article)    
        else
            render 'new'
        end
    end

    private
    def set_position
        @position = Position.find(params[:id])
    end
    
end
