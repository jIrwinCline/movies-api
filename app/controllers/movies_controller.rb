class MoviesController < ApplicationController

  def index
    if params[:token] && Token.find_by_token_hash(params[:token])
    
      @movies = Movie.all.order("title ASC").offset(0).limit(100)
      json_response(@movies)
    else
      json_response({:message => "Use a token for access"})
    end
  end

  def show
    if params[:token] && Token.find_by_token_hash(params[:token])
      movie_id = params[:id]
      @movie = Movie.find(movie_id)
      json_response(@movie)
    else
      json_response({:message => "Use a token for access"})
    end
  end

end
