class Movie < ApplicationRecord
  
  after_initialize :add_url

  def add_url
    self.url = "http://localhost:3000/movies/#{self.id}"
    self.save
  end

end
