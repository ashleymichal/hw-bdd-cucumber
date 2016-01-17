class CreateMovieGoers < ActiveRecord::Migration
  def change
    create_table :movie_goers do |t|
      t.string :name
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end
