class Movie < ActiveRecord::Base

  def self.all_ratings
    %w[G PG PG-13 NC-17 R]
  end
  # attr_accessible :title, :rating, :description, :release_date, :director
  validates :title, :presence => true
  validates :rating, :inclusion => {:in => Movie.all_ratings}, :unless => :grandfathered?
  validates :release_date, :presence => true
  validate :released_1930_or_later # custom validator below

  before_save :capitalize_title

  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end
  
  class Movie::InvalidKeyError < StandardError ; end
  
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      release_date && release_date < Date.parse('1 Jan 1930')
  end

  @@grandfathered_date = Date.parse('1 Nov 1968')
  
  def grandfathered?
    release_date && release_date < @@grandfathered_date
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
