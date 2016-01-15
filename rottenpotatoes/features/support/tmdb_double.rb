module TmdbDouble
  def stub_api
    FakeWeb.register_uri(:any, %r|https://api\.themoviedb\.org|, :body => "FakeWeb Working!")
  end
end

World(TmdbDouble)

After do
  @api_stubbed = false
end
