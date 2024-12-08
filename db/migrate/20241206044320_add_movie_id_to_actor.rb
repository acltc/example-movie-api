class AddMovieIdToActor < ActiveRecord::Migration[7.2]
  def change
    add_column :actors, :movie_id, :integer
  end
end
