class Actor < ActiveRecord 
    belongs_to :movie
    has_many :movies 
    has_many :movies, through: :actor_movies

end
