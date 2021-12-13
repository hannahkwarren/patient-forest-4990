class Movie < ApplicationRecord
  belongs_to :studio

  # private
  # def movie_params
  #   params.permit(:title, :creation_year, :genre)
  # end
end
