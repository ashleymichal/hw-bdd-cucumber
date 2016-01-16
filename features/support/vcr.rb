VCR.configure do |c|
	c.ignore_localhost = true
  c.cassette_library_dir = 'features/cassettes'
  c.hook_into :webmock
end

VCR.cucumber_tags do |t|
  t.tag '@vcr', use_scenario_name: true 
end