class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.text :plot

      t.timestamps
    end
  end
end
