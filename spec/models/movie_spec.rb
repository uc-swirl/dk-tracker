require 'spec_helper'

describe Movie do
	it 'similar should return movies with the same director' do
		movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )
		movie2 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )
		Movie.similar(movie1.director).should include(movie1, movie2)
	end
	
	it 'should return a list of all ratings' do
		Movie.ratings.should include('G','PG','PG-13','R')
	end

end
