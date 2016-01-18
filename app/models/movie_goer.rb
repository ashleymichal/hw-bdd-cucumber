class MovieGoer < ActiveRecord::Base
	attr_accessible :uid, :provider, :name
	def self.create_with_omniauth auth
		create! do |moviegoer|
			moviegoer.provider == auth["provider"]
			moviegoer.uid 		 == auth["uid"]
			moviegoer.name 		 == auth["info"]["name"]
		end
	end
end
