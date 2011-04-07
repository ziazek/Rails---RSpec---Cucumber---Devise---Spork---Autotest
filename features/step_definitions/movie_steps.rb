Given /^a genre named Comedy$/ do
  @comedy = Genre.create!(:name => "Comedy")
end

When /^I create a movie (.*) in the (.*) genre$/ do |movie, genre|
  # visit movies_path
  When "I go to the movie index page"
  click_link "Add Movie"
  fill_in "Title", :with => movie
  select "1980", :from => "Release year"
  check genre
  click_button "Save"
end

Then /^Caddyshack should be in the Comedy genre$/ do
  visit genres_path
  click_link "Comedy"
  # save_and_open_page
  page.should have_content("1 movie")
  page.should have_content("Caddyshack")
end
