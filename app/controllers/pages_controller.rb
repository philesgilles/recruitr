class PagesController < ApplicationController
    before_action :require_user
    def home
        @positions = Position.all
    end
    
end
