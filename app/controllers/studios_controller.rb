class StudiosController < ApplicationController

    def index 
        @studios = Studio.all
        @studio_movies = Movie.where(params[:studio_id])
    end


end
