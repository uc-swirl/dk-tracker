# Add a declarative step here for populating the DB with movies.


Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
	assert Movie.find_by_title(title).director == director
end
# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.

  r1 = Regexp.new e1
  r2 = Regexp.new e2

  i1 = page.body =~ r1
  i2 = page.body =~ r2
  assert i1, "#{e1} is not present"
  assert i2, "#{e2} is not present"
  assert i2 > i1, "#{e1} at [#{i2}] does not appear before #{e2} at [#{i1}]"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb


  rating_list.split(", ").each do |rating|
    if uncheck
      step "I uncheck \"ratings_#{rating}\"" 
    elsif
      step "I check \"ratings_#{rating}\"" 
    end
  end

end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step "I should see \"#{movie.title}\"";    
  end 
end