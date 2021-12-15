class MoviesController < ApplicationController

    def show
        @movie = Movie.find(params[:id])
        @actors = @movie.actors_by_age
        @avg_age = @movie.average_actor_age.to_i

        if params[:search].present?
            @search_actors = Actor.search(params[:search])
        end
    end
    
end
