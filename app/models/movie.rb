class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date
  @@ratings = ['G','PG','PG-13','R']
  def self.ratings
  	@@ratings
  end
end
