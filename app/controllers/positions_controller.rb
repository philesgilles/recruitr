class PositionsController < ApplicationController
    before_action :set_position, only:[:edit,:update,:show,:destroy]
    def index
        @positions = Position.all
    end
    def show
        
    end
    def new
        @position = Position.new
    end
    def create
        #just check if params are passing
        #render plain: params[:position].inspect

        @position = Position.new(position_params)
        if @position.save
            flash[:success] = "Positon was successfully created"
            redirect_to position_path(@position)    
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @position.update(position_params)
            flash[:success] = "Position was successfully updated"
            redirect_to position_path(@position)    
        else
            render 'edit'
        end
        
    end
    def destroy
        @position.destroy
        flash[:danger] = "position was successfully deleted"
        redirect_to positions_path
        
    end

    private
    def set_position
        @position = Position.find(params[:id])
    end
    def position_params
        params.require(:position).permit(:title,:description,:requirements, :responsibilities)
    end
    
end
