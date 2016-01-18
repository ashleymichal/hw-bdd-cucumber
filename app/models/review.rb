class Review < ActiveRecord::Base
	belongs_to :movie
	belongs_to :movie_goer
	attr_protected :movie_goer_id
end