class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_by_age
    self.actors.order(age: :asc)
  end

  def average_actor_age
    self.actors.average(:age)
  end
end
