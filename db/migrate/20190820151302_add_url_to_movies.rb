class AddUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    change_table :movies do |t|
      t.string :url
    end
  end
end
