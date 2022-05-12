class CreateMovieRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_ratings do |t|
      t.references :title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
