require 'spec_helper'

describe MoviesController do
	describe "find similar movies" do
		it 'should return similar movies' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )
			movie2 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )

			get :similar, :id => movie2.id
			expect(assigns(:movies)).to include(movie1)
		end
		it 'should render similar template' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )

			get :similar, :id => movie1.id

			expect(response).to render_template("similar")

		end

		it 'should call the similar method of Movies' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992', :director => "Marco"} )
			Movie.should_receive("similar")
			get :similar, :id => movie1.id

		end
		
		it 'should redirect to homepage if no similar movies' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'} )
			get :similar, :id => movie1.id
			expect(response).to redirect_to(movies_path())
		end
	end
	
	describe "movies:show" do
		it 'should render show template' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'} )
			get :show, :id => movie1.id
			expect(response).to render_template("show")
		end
	end
	
	describe "movies:index" do
		it 'should assign @movies to be some movies' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'} )
			movie2 = Movie.create({:title => 'Aladdin2', :rating => 'G', :release_date => '25-Nov-1992'} )
			get :index
			expect(assigns(:movies)).to include(movie1, movie2)
		end
		it 'should render the index template' do
			get :index
			expect(response).to render_template("index")
		end
		it 'should provide a list of ratings' do
			get :index
			
			expect(assigns(:all_ratings)).to include('G','PG','PG-13','R')
		end
	end
	
	describe "movies:index" do
		it 'should assign @movies to be some movies' do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'} )
			movie2 = Movie.create({:title => 'Aladdin2', :rating => 'G', :release_date => '25-Nov-1992'} )
			get :index
			expect(assigns(:movies)).to include(movie1, movie2)
		end
		it 'should render the index template' do
			get :index
			expect(response).to render_template("index")
		end
		it 'should provide a list of ratings' do
			get :index
			
			expect(assigns(:all_ratings)).to include('G','PG','PG-13','R')
		end
		
		it 'should redirect to include sortBy' do
			get :index, {}, { :movie_form_params => { :sortBy => 'title' }}
			expect(response).to redirect_to(movies_path(:sortBy => 'title'))
		end
		it 'should redirect to include ratings filter' do
			get :index,  {}, { :movie_form_params => { :ratings => {"G" => "1" }}}
			expect(response).to redirect_to(movies_path(:ratings => {"G" => "1" }))

		end
	end
	
	describe "movie creation" do
		 it "should increment the number of movies" do
		    expect{post :create, {:title => "Ice Age", :rating => "PG", :release_date => '25-Nov-1992'}}.
		    	to change{Movie.all.length}.by(1)
		  end
	end
	
	describe "movie editing" do
		 it "Should make the particular movie available" do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'} )
			get :edit, {:id => movie1.id}

			expect(assigns(:movie)).to eq(movie1)
		 end
		
		 it "Updating should change fields" do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'})
			put :update, {:id => movie1.id, :movie => {:title => "Req. for a Dream", :rating => 'G', :release_date => '25-Nov-1992'}}

			expect(Movie.find(movie1.id).title).to eq("Req. for a Dream")
		 end
		 
		 it "It should destroy itself" do
			movie1 = Movie.create({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'})
			delete :destroy, {:id => movie1.id}			
			expect {Movie.find(movie1.id)}.to raise_exception ActiveRecord::RecordNotFound
		 end
	end
end
