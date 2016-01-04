Rottenpotatoes::Application.routes.draw do
	post '/movies/search_tmdb'
	get '/movies/:id/similar_movies' => 'movies#similar_movies'
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

end
