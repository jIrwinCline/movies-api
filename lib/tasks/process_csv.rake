require 'pry'
require 'rake'


desc "this is a test"
task :process_csv => :environment do
  counter = 0
CSV.foreach('the-movies-dataset/movies_metadata.csv', :headers => true) do |row|


    counter += 1
    puts counter
    movie = Movie.new()
    movie.adult = row["adult"]
    movie.budget = row["budget"]
    movie.genres = row["genres"]
    movie.homepage = row["homepage"]
    movie.imdb_id = row["imdb_id"]
    movie.original_language = row["original_language"]
    movie.original_title = row["original_title"]
    movie.overview = row["overview"]
    movie.popularity = row["popularity"]
    movie.production_companies = row["production_companies"]
    movie.production_countries =  row["production_countries"]
    movie.release_date =  row["release_date"]
    movie.revenue =  row["revenue"]
    movie.runtime =  row["runtime"]
    movie.spoken_languages =  row["spoken_languages"]
    movie.status =  row["status"]
    movie.tagline =  row["tagline"]
    movie.title =  row["title"]
    movie.video =  row["video"]
    movie.vote_average =  row["vote_average"]
    movie.vote_count =  row["vote_count"]

    movie.save
  end

end
