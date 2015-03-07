class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, :director
  @@ratings = ['G','PG','PG-13','R']
  def self.ratings
  	@@ratings
  end
  
  def self.similar (director)
  	return Movie.find_all_by_director(director)
  end
end
