Rottenpotatoes::Application.routes.draw do
	get 'auth/:provider/callback' => 'sessions#create'
	get 'logout' => 'sessions#destroy'
	get 'auth/failure' => 'sessions#failure'

	post '/movies/search_tmdb'
	get '/movies/:id/similar_movies' => 'movies#similar_movies'
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')

end
