Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    new_movie = Movie.new(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date], :director => movie[:director])
    new_movie.save
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body.index(e1) < page.body.index(e2)
end

When /I (un)?check the following ratings: "(.*)"/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    uncheck ? uncheck("ratings_#{rating}") : check("ratings_#{rating}")
  end
end

Then /I should see all the movies/ do
  expect(page).to have_css("tr", count: 11)
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
end