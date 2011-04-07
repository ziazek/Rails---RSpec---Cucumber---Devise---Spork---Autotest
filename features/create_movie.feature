Feature: Create movie
  In order to let customers browse movies by genre
  As a site administrator
  I want create a movie in a specific genre
	
	# @javascript
	Scenario: Create movie in genre
	  Given a genre named Comedy
	  When I create a movie Caddyshack in the Comedy genre
	  Then Caddyshack should be in the Comedy genre
	
	
	
