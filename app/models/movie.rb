class Movie < ApplicationRecord

  after_initialize :add_url

  def add_url
    if !self.url
      self.url = "http://localhost:3000/movies/#{self.id}"
      self.save
    end
  end

  scope :random, -> {order("RANDOM()").limit(1)}
  scope :longest, ->{where("runtime IS NOT NULL").order("runtime desc").limit(10)}
end
