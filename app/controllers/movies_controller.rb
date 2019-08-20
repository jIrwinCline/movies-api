class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order("title ASC").offset(0).limit(100)
    json_response(@movies)
  end

  def show
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
    json_response(@movie)
  end

end
