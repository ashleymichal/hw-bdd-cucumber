class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer			'potatoes'
    	t.text				'comments'
    	t.references	'movie_goer'
    	t.references	'movie'
    end
  end
end
