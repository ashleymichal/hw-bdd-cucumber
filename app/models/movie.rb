class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_goers, :through => :reviews
  attr_accessible :title, :rating, :description, :release_date, :director
  validates :title, :presence => true

  class Movie::InvalidKeyError < StandardError ; end

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_in_tmdb search_term
  	begin
	  	Tmdb::Movie.find(search_term)
	  rescue NoMethodError => tmdb_gem_exception
	  	if Tmdb::Api.response['code'] == 401
	  		raise Movie::InvalidKeyError, 'Invalid API key'
	  	else
	  		raise tmdb_gem_exception
	  	end
	  end
  end

  def name_with_rating
  	"#{title} (#{rating})"
  end

  def self.similar_movies search_term
    Movie.where(search_term).order(:release_date => :asc)
  end

end
