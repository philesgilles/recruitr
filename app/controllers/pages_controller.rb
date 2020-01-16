class PagesController < ApplicationController
    def home
        @positions = Position.all
    end
    
end
