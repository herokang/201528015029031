class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    # if the incoming URI is lacking the right params[]
    # then redirect_to the new URI containing the appropriate parameters
    need_redirect = false 
    
    @sort_by = params[:sort_by]
    if @sort_by == nil
      @sort_by = session[:sort_by]
      if @sort_by == nil
        @sort_by = "title" # order by title defaultly
      end
      need_redirect = true
    end
    session[:sort_by] = @sort_by # update session
    
    @all_ratings = Movie.ratings
    @ratings = params[:ratings]
    if @ratings == nil || @ratings.empty?
      @ratings = session[:ratings]
      if @ratings == nil || @ratings.empty?
        @ratings = @all_ratings
      end
      need_redirect = true
    elsif @ratings.kind_of?(Hash)
      @ratings = @ratings.keys
    end
    session[:ratings] = @ratings
    
    if need_redirect
      flash.keep
      redirect_to movies_path(:sort_by => @sort_by, :ratings => @ratings)
    end
    
    if @sort_by == "title" 
      @movies = Movie.where(["rating IN (?)", @ratings]).order("title ASC")
    elsif @sort_by == "release_date" 
      @movies = Movie.where(["rating IN (?)", @ratings]).order("release_date ASC")
    else
      @movies = Movie.all
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
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
