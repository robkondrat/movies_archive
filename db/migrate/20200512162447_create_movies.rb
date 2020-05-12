class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.text :description
      t.integer :director_id
      t.text :actors
      t.integer :year
      t.integer :runtime
      t.integer :rating
      t.integer :votes
      t.integer :revenue
      t.integer :metascore

      t.timestamps
    end
  end
end
