class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors 
  has_many :actors, through: :actor_movies
  # private
  # def movie_params
  #   params.permit(:title, :creation_year, :genre)
  # end
end
