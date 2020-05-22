class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.youngest_to_oldest
    Actor.order(:age)
  end 

  def self.average_age
    Actor.average(:age)
  end 
end