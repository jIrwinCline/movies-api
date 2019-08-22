class Movie < ApplicationRecord

  after_initialize :add_url, :format_genre, :format_production

  def add_url
    if !self.url
      self.url = "http://localhost:3000/movies/#{self.id}"
      self.save
    end
  end

  def format_genre
    genres = self.genres
    genres.delete!("[]{}',:0123456789\"")
    genres = genres.split(" ")
    genres.delete("id")
    genres.delete("name")

    genres = genres.join(",")
    self.genres = genres
  end

  def format_production
    company = self.production_companies
    company = company.split(" ")
    pattern1 = /\[\{\'name\'\:/
    pattern2 = /'id':/
    i = 0
    production_co = []
    company.length.times do |i|
      if (!pattern1.match(company[i]) && !pattern2.match(company[i]))
        production_co.push(company[i])
      end
    end
    production_co.pop
    production_co = production_co.join(" ")
    self.production_companies = production_co

  end

  scope :random, -> {order("RANDOM()").limit(1)}

  scope :longest, ->{where("runtime IS NOT NULL").order("runtime desc").limit(10)}

  scope :rating, ->{where("vote_average IS NOT NULL").order("vote_average desc").limit(10)}

  scope :high_votes, ->{where("vote_count IS NOT NULL").order("vote_count desc").limit(10)}

  scope :popular, -> {where("vote_count IS NOT NULL").where("vote_average IS NOT NULL").order("vote_count desc").limit(100).order("vote_average desc")}

  def self.partial_title(title)
    title = title.downcase
    self.where("lower(title) LIKE '%#{title}%'").order("popularity desc")
  end

  def self.year_released(year)

    self.where "release_date > '#{year}0101' AND release_date < '#{year}1231'"
  end
  # working on a most hated scope but having issues due to how ratings were entered in the table as strings
  # what idiot did that, i wonder
  # scope :most_hated, -> {where("vote_count IS NOT NULL").where("vote_average IS NOT NULL").where.not(vote_count: 0).limit(1000).reorder("vote_average asc").limit(10)}

  def self.title_by_letter(letter)
    self.where("title LIKE '#{letter.upcase}%'").offset(0)
  end

end
