class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies  do |t|
      t.boolean :adult
      t.bigint :budget
      t.string :genres
      t.string :homepage
      t.string :imdb_id
      t.string :original_language
      t.string :original_title
      t.text :overview
      t.string :popularity
      t.string :production_companies
      t.string :production_countries
      t.date :release_date
      t.bigint :revenue
      t.bigint :runtime
      t.string :spoken_languages
      t.string :status
      t.string :tagline
      t.string :title
      t.boolean :video
      t.string :vote_average
      t.bigint :vote_count
    end
  end
end
