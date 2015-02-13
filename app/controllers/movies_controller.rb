class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    if (session[:movie_form_params])
      if (params[:sortBy] == nil and session[:movie_form_params][:sortBy]) 
        params[:sortBy] = session[:movie_form_params][:sortBy]
        flash.keep
        return redirect_to movies_path(params)
      end
      if (params[:ratings] == nil and session[:movie_form_params][:ratings]) 
        params[:ratings] = session[:movie_form_params][:ratings]
        flash.keep
        return redirect_to movies_path(params)
      end
    end


    session[:movie_form_params] = {:sortBy => params[:sortBy],:ratings => params[:ratings]}

    # if (not (params[:ratings]) and session[:movie_form_ratings])
    #   params[:ratings] = session[:movie_form_ratings]
    #   #flash.keep
    # end
    #redirect_to
    #session[:movie_form_ratings] = params[:ratings]

    @query = Movie.where("")
    if (params[:sortBy]) 
      @sortBy = params[:sortBy].to_sym
      @query =  @query.order(@sortBy)
    end

    @rating_checkboxes = Hash.new
      Movie.ratings.each { |rating|
      @rating_checkboxes[rating] = not(params[:ratings])
    }

    if (params[:ratings]) 
      @query = @query.where(:rating => params[:ratings].keys)
      params[:ratings].each_pair { |rating, val|
      @rating_checkboxes[rating] = true
    }
    end
    @ratings_passthrough = params[:ratings]
    @movies = @query
    @all_ratings = Movie.ratings

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
